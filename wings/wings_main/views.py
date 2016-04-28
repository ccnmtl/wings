from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.shortcuts import get_object_or_404, render
from django.template import RequestContext, loader
from django.http import HttpResponseRedirect, HttpResponse, Http404
from .models import Participant, traverse_tree, section_rank
from pagetree.models import Section, Hierarchy, PageBlock
from functools import wraps

from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login

import os
import datetime
from django.conf import settings

from wings.quizblock.models import Submission


def background(request, content_to_show):
    """ the pagetree page view breaks flatpages, so this is a simple
    workaround."""
    file_names = {
        'about': 'about.html',
        'credits': 'credits.html',
        'contact': 'contact.html',
        'help': 'help.html',
    }

    if content_to_show not in file_names.keys():
        return HttpResponseRedirect('/accounts/login/?next=%s' % request.path)
    file_name = file_names[content_to_show]
    t = loader.get_template('wings_main/standard_elements/%s' % file_name)
    c = RequestContext(request, {})
    return HttpResponse(t.render(c))


def staff_or_404(view_func):
    """
    Decorator for views that checks that the user is logged in and is a staff
    member, raising a 404 if necessary.
    http://djangosnippets.org/snippets/2599/
    """
    def _checklogin(request, *args, **kwargs):
        if request.user.is_active and request.user.is_staff:
            # The user is valid. Continue to the admin page.
            return view_func(request, *args, **kwargs)
        else:
            raise Http404
    return wraps(view_func)(_checklogin)


""" Wings-specific helper functions called by forest_main page view
method. This is view code so it goes here. Some of this code is
last-minute ad-hoc patches to work around inconsistent content in the
DB; honi soit qui mal y pense. """


def is_image_file(filename):
    """Does `filename` appear to be an image file?"""
    img_types = [".jpg", ".jpeg", ".png", ".gif"]
    ext = os.path.splitext(filename)[1]
    return ext in img_types


def pick_decoration_image(rank):
    """ Pick an arbitrary decoration image out of a directory
    specified in SETTINGS."""
    path = settings.DECORATION_IMAGE_PATH
    images_location = os.path.realpath(settings.SITE_MEDIA_ROOT + path)
    usable_images = [
        f for f in os.listdir(images_location) if is_image_file(f)]
    # just cycle through them one at a time
    which_image = rank % len(usable_images)
    image_to_use = usable_images[which_image]
    return settings.SITE_MEDIA_URL + path + image_to_use


def pick_decoration_side(rank):
    even = (rank % 2 == 0)
    if even:
        return 'image_on_left'
    else:
        return 'image_on_right'


def decoration_info(section):
    """Generate some info that the section can use to decorate itself."""

    really_depressing_sections = [
        Section.objects.get(id=x)
        for x in settings.REALLY_DEPRESSING_SECTION_IDS]
    really_depressing_content = is_descendent_of(
        section,
        really_depressing_sections)
    hide_title_sections = [
        Section.objects.get(id=x)
        for x in settings.HIDE_TITLE_SECTION_IDS]
    the_rank = section_rank(section)

    result = {
        'rank': the_rank,
        'image': pick_decoration_image(the_rank),
        'decoration_side': pick_decoration_side(the_rank),
        'really_depressing': really_depressing_content,
        'hide_title': False,
    }

    if not whether_to_show_decorations(section):
        result['decoration_side'] = ''

    if really_depressing_content:
        # we have a special image for this case.
        result['decoration_side'] = 'image_on_right'

    if any(s.block().display_name == 'Image Pullquote'
           for s in section.pageblock_set.all()):
        result['decoration_side'] = 'image_on_right'

    # this is just working around some inconsistent content in the DB at
    # the last minute in QA.
    if is_descendent_of(section, hide_title_sections):
        if any(s.block().display_name == 'Quiz'
               for s in section.pageblock_set.all()):
            result['hide_title'] = True

    return result


def is_descendent_of(section, set_of_parents):
    for a in range(10):
        if section in set_of_parents:
            return True
        section = section.get_parent()
        if section.is_root():
            return False


def whether_to_show_decorations(section):
    """ Our decorations are annoying and/or counterproductive on some
    pages.  Don't show them on sections that contain certain kinds of
    blocks.  Also, the content on the first couple of sections
    (screening for ipv and empowerment) is incompatible with cheerful
    imagery.
    """

    block_types_that_hide_decorations = \
        settings.BLOCK_TYPES_THAT_HIDE_DECORATIONS
    myblocks = section.pageblock_set.all()
    result = not any(
        b.block().display_name in block_types_that_hide_decorations
        for b in myblocks)
    return result


def check_next_page(request, section):
    """ If the logged in user is a participant, checks that the user
    is allowed to see the next page."""

    assert request.user is not None
    assert not request.user.is_anonymous()
    assert request.user.is_authenticated()

    try:
        user_participant = request.user.part()
    except AttributeError:
        user_participant = None

    if user_participant is None:
        return True
    else:
        # this is a participant. log their visit and double-check they can
        # see the page:
        participant_can_navigate_to_page = user_participant.log_visit(
            section,
            request)
        if participant_can_navigate_to_page:
            return True
        else:
            # clients can only advance one page at a time.
            # and must perform each activity's task before proceeding.
            messages.warning(
                request,
                'Please finish this page before moving forward.')
            return False


def destination_on_check_next_page_fail(request):
    """Where do we send participants if they fail the check_next_page test?"""
    user_participant = request.user.part()
    assert user_participant is not None
    return user_participant.current_url()


@login_required
def first(request):
    """ Just a convenience URL that points at whichever section
    happens to be the first in the intervention."""
    first_url = Hierarchy.objects.all()[0].get_root(
    ).get_first_child().get_absolute_url()
    return HttpResponseRedirect(first_url)


def make_and_login_participant(id_string, request):
    """ If there is a participant with this id_string, log them in. If
    not, create one and log them in.  See:
    http://stackoverflow.com/questions/3222549/
       how-to-automatically-login-a-user-after-registration-in-django
    """
    # you'd better check before invoking this function.
    assert request.user.is_staff
    participant = get_object_or_404(Participant, id_string=id_string)
    if not participant.user:
        assert participant.user is None  # do not mock this line.
        new_user = User()
        new_user.set_unusable_password()
        new_user.username = id_string
        new_user.save()
        participant.user = new_user
        participant.save()
    participant.user.backend = 'django.contrib.auth.backends.ModelBackend'
    assert participant.user is not None
    messages.info(request, "Logged in!")
    authenticate(
        username=participant.user.username,
        password=participant.user.password)
    login(request, participant.user)
    return participant


@login_required
def launch_participant(request, id_string):
    """Create a new user with a pointer to the participant
    object. Redirect them to the first page of the intervention. """
    if not request.user.is_staff:
        messages.info(request, "Sorry, you can't launch participants.")
        return HttpResponseRedirect('/first/')

    try:
        participant = make_and_login_participant(id_string, request)
    except:
        messages.error(
            request,
            "There was a database error; and we could not launch user P%s " %
            id_string)
        return HttpResponseRedirect('/')

    if not participant.current_section_id:
        return HttpResponseRedirect('/first/')
    else:
        messages.info(request, "Welcome back!")
        return (
            HttpResponseRedirect(
                Section.objects.get(
                    id=participant.current_section_id).get_absolute_url(
                    ))
        )


@login_required
def participant_exit_materials(request):
    """
    Show the exit materials for the logged in user (mostly this will
    be participants.)
    (r'^exit_materials/', 'wings_main.views.participant_exit_materials'),

    """
    return exit_materials_nodes(request)


@login_required
def exit_materials(request, id_string):
    """
    logout user (if necessary), log in as a participant, and then show
    exit materials #exit materials for a particular participant (meant
    to be accessed by the facilitator from the list of participants)

    (r'^participant/(?P<id_string>\d+)/exit_materials/',
      'wings_main.views.exit_materials'),
    """
    if request.user.is_staff:
        make_and_login_participant(id_string, request)
        return exit_materials_nodes(request)

    if (request.user.part() is not None and
            request.user.part().id_string == long(id_string)):
        return exit_materials_nodes(request)

    return HttpResponseRedirect('/logout/')


def exit_materials_nodes(request):
    safety_plan_part_1_node_list = []
    traverse_tree(
        PageBlock.objects.get(id=settings.SAFETY_PLAN_PART_1_ID).section,
        safety_plan_part_1_node_list)
    safety_plan_part_2_node_list = []
    traverse_tree(
        PageBlock.objects.get(id=settings.SAFETY_PLAN_PART_1_ID).section,
        safety_plan_part_2_node_list)
    goal_setting_node_list = []
    traverse_tree(Section.objects.get(id=settings.GOAL_SETTING_SECTION_ID),
                  goal_setting_node_list)
    steps_to_increase_support_node_list = []
    traverse_tree(
        Section.objects.get(id=settings.STEPS_TO_INCREASE_SUPPORT_SECTION_ID),
        steps_to_increase_support_node_list)

    ssnm_tree_node = PageBlock.objects.get(id=settings.SSNM_TREE_NODE_ID)
    resources_node = PageBlock.objects.get(id=settings.RESOURCES_NODE_ID)
    action_plan_node = PageBlock.objects.get(id=settings.ACTION_PLAN_NODE_ID)

    return render(request, 'wings_main/exit_materials.html', {
        'safety_plan_part_1_node_list': safety_plan_part_1_node_list,
        'safety_plan_part_2_node_list': safety_plan_part_2_node_list,
        'goal_setting_node_list': goal_setting_node_list,
        'steps_to_increase_support_node_list':
        steps_to_increase_support_node_list,
        'ssnm_tree_node': ssnm_tree_node,
        'resources_node': resources_node,
        'action_plan_node': action_plan_node,
    })


@staff_or_404
def summary(request):
    node_list = []
    traverse_tree(Hierarchy.objects.all()[0].get_root(), node_list)
    return render(request, 'wings_main/summary.html', {'tree': node_list})


def all_questions_in_order():
    """All the questions that are actually asked during the
    intervention, in the order they are actually asked during the
    intervention."""

    node_list = []
    traverse_tree(Hierarchy.objects.all()[0].get_root(), node_list)

    the_questions_in_order = []
    for s in node_list:
        for pb in s.pageblock_set.all():
            if pb.content_type.name == 'quiz':
                the_questions_in_order.extend(pb.block().question_set.all())

    return the_questions_in_order


def estimate_intervention_duration_for_all_participants():
    all_submission_dates = {}

    users = [u for u in User.objects.all() if u.part()]

    for u in users:
        all_submission_dates[u.id] = set()

    all_submissions = Submission.objects.all()
    for s in all_submissions:
        try:
            all_submission_dates[s.user.id].add(s.submitted)
        except KeyError:
            pass

    return estimate_intervals(all_submission_dates)


def estimate_intervals(all_submission_dates):
    intervals = {}
    for user_id, the_dates in all_submission_dates.iteritems():
        if len(the_dates) > 0:
            gaps = sum_of_gaps_longer_than_x_minutes(70, list(the_dates))
            timedelta = max(the_dates) - min(the_dates)
            seconds = my_total_seconds(timedelta)
            minutes = seconds / 60.0
            intervals[user_id] = minutes - gaps
        else:
            intervals[user_id] = -9

    return intervals


@staff_or_404
def all_answers(request):
    """ all numerical answers for all users in a giant table. Also
    contains intervention length estimate"""
    node_list = []
    traverse_tree(Hierarchy.objects.all()[0].get_root(), node_list)
    intervention_Length_dict = \
        estimate_intervention_duration_for_all_participants()

    users = [u for u in User.objects.all() if u.part()]

    for u in users:
        try:
            u.how_long = intervention_Length_dict[u.id]
        except KeyError:
            u.how_long = -9

    return render(request, 'wings_main/all_answers.html', {
        'users': users,
        'questions': all_questions_in_order(),
    })


def sum_of_gaps_longer_than_x_minutes(x, list_of_timestamps):
    """ as described in bug http://pmt.ccnmtl.columbia.edu/item/87836/
    basically if there are gaps that are longer than x, we assume the
    user was not doing the activity.  so in that case we don't count
    that toward the total duration of the activity for them.
    """
    threshold = datetime.timedelta(minutes=x)
    if len(list_of_timestamps) < 2:
        return 0
    list_of_timestamps.sort()
    start_times = list_of_timestamps[:-1]
    end_times = list_of_timestamps[1:]
    gaps_longer_than_x_in_seconds = [
        my_total_seconds(b - a)
        for a, b in zip(start_times, end_times)
        if (b - a > threshold)]
    return sum(gaps_longer_than_x_in_seconds) / 60


def my_total_seconds(td):
    """Python's timedelta did not have a 'total_seconds' method before
    python 2.7. I just."""
    return (
        (td.microseconds + (td.seconds + td.days * 24.0 * 3600.0) *
         10.0 ** 6.0) / 10.0 ** 6.0
    )


def make_submissions_table(all_submissions, all_submission_dates):
    the_table = []
    for s in all_submissions:
        for q in s.quiz.question_set.all():
            the_table.append(
                {'qid': q.id,
                 'uid': s.user.id,
                 'date': s.submitted})
        try:
            all_submission_dates[s.user.id].add(s.submitted)
        except KeyError:
            pass
    return the_table, all_submission_dates


def calculate_user_gaps(users, the_table):
    user_gaps = {}
    for the_user in users:
        the_dates_for_this_user = [
            x['date'] for x in the_table if x['uid'] == the_user.id]
        user_gaps[the_user.id] = sum_of_gaps_longer_than_x_minutes(
            70,
            the_dates_for_this_user)
    return user_gaps


@staff_or_404
def timestamps(request):
    """when the user was signed up, and when they answered all the questions.

    Disclaimer:
    this code is a report; it will be run few times by few users.
    It's basically a manage.py command with a pretty front end.
    It's not meant to be pretty or fast, and is in fact neither.
    """

    # get some data structures ready
    all_the_questions = all_questions_in_order()
    all_submission_dates = {}
    users = [u for u in User.objects.all() if u.part()]
    for u in users:
        all_submission_dates[u.id] = set()

    launch_timestamps = dict((u.id, u.date_joined) for u in users)

    all_submissions = Submission.objects.all()

    # Put all the submission stuff into a table in memory
    the_table, all_submission_dates = make_submissions_table(
        all_submissions, all_submission_dates)

    # figure out gaps now
    user_gaps = calculate_user_gaps(users, the_table)

    intervals = {}
    intervals_first_24_hrs = {}

    start_from_launch = True  # include the launch timestamp in our estimates
    for user_id, the_dates in all_submission_dates.iteritems():
        # if user_id == SPECIAL_NUMBER:
        if len(the_dates) > 0:
            if start_from_launch:
                start_time = launch_timestamps[user_id]
            else:
                # when the user answered the first quiz.
                start_time = min(the_dates)
            # estimate how long the user spent on the intervention. This
            # includes the launch timestamp.
            timedelta = max(the_dates) - start_time
            seconds = my_total_seconds(timedelta)
            minutes = seconds / 60.0
            intervals[user_id] = minutes - user_gaps[user_id]

            # what if we only consider the first 24 hours after the launch
            # timestamp?
            a_day_later = start_time + datetime.timedelta(days=1)
            the_dates_in_the_first_24_hours = [
                d for d in the_dates if d < a_day_later]
            if len(the_dates_in_the_first_24_hours) > 0:
                modified_timedelta = max(
                    the_dates_in_the_first_24_hours) - start_time
                the_gaps = sum_of_gaps_longer_than_x_minutes(
                    70,
                    the_dates_in_the_first_24_hours)
                seconds_2 = my_total_seconds(modified_timedelta)
                minutes_2 = seconds_2 / 60.0
                intervals_first_24_hrs[user_id] = minutes_2 - the_gaps
            else:
                intervals_first_24_hrs[user_id] = 0
        else:
            intervals[user_id] = -9
            intervals_first_24_hrs[user_id] = -9

    users = get_the_view_table_ready(
        users, intervals, intervals_first_24_hrs, all_the_questions,
        the_table)

    return render(request, 'wings_main/timestamps.html', {
        'users': users,
        'questions': all_the_questions,
    })


def get_the_view_table_ready(users, intervals, intervals_first_24_hrs,
                             all_the_questions, the_table):
    for u in users:
        u.dates = []
        u.how_long = intervals[u.id]
        u.how_long_2 = intervals_first_24_hrs[u.id]
        for q in all_the_questions:
            dates_for_this_question = [
                (q.id, t['date'])
                for t in the_table if (t['qid'] == q.id and t['uid'] == u.id)]
            u.dates.append(dates_for_this_question)


@staff_or_404
def text_answers(request):
    """ all text answers for all users in a giant table"""
    node_list = []
    traverse_tree(Hierarchy.objects.all()[0].get_root(), node_list)
    return render(request, 'wings_main/text_answers.html', {
        'users': [u for u in User.objects.all() if u.part()],
        'questions': all_questions_in_order(),
    })


@staff_or_404
def all_answers_key(request):
    """ key for the above"""
    return render(request, 'wings_main/all_answers_key.html', {
        'questions': all_questions_in_order(),
    })


@staff_or_404
def all_answers_key_table(request):
    """ An easy-to-import-into-EXCEL tabular version of
    all_answers_key above."""
    return render(request, 'wings_main/all_answers_key_table.html', {
        'questions': all_questions_in_order(),
    })
