# Create your views here.
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse, HttpResponseNotFound
from wings_main.models import Participant, traverse_tree, section_rank
from pagetree.models import Section, Hierarchy, PageBlock
from django.db import transaction


from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login

#from forms import UploadVideoForm,AddSeriesForm
import uuid, os, re, datetime
from django.conf import settings
from django.db import transaction
from django.core.paginator import Paginator, EmptyPage, InvalidPage
from restclient import GET,POST
from simplejson import loads, dumps
from django.db.models import Q

class rendered_with(object):
    def __init__(self, template_name):
        self.template_name = template_name

    def __call__(self, func):
        def rendered_func(request, *args, **kwargs):
            items = func(request, *args, **kwargs)
            if type(items) == type({}):
                return render_to_response(self.template_name, items, context_instance=RequestContext(request))
            else:
                return items

        return rendered_func

""" Wings-specific helper functions called by forest_main page view method. This is view code so it goes here."""
if True:

            def is_image_file(filename):
                """Does `filename` appear to be an image file?"""
                img_types = [".jpg", ".jpeg", ".png", ".gif"]
                ext = os.path.splitext(filename)[1]
                return ext in img_types

            def pick_decoration_image(rank):
                """ Pick an arbitrary decoration image out of a directory specified in SETTINGS."""
                path = settings.DECORATION_IMAGE_PATH
                images_location = os.path.realpath(settings.SITE_MEDIA_ROOT + path)
                usable_images = [f for f in os.listdir(images_location) if is_image_file(f)]
                which_image = rank % len(usable_images) #just cycle through them one at a time
                image_to_use = usable_images [which_image]
                return settings.SITE_MEDIA_URL + path +  image_to_use

            def pick_decoration_side ( rank):
                even = (rank % 2 == 0)
                if even:
                    return 'image_on_left'
                else:
                    return 'image_on_right'

            def decoration_info(section):
                """Generate some info that the section can use to decorate itself."""
                the_rank = section_rank (section)
                result = {
                    'rank'  :           the_rank,
                    'image' :           pick_decoration_image    (the_rank),
                    'decoration_side' : pick_decoration_side (the_rank)
                }
                if not whether_to_show_decorations (section):
                    result ['decoration_side'] = '';
                return result
                
                
            def whether_to_show_decorations (section):
                """ Our decorations are annoying and/or counterproductive on some pages.
                Don't show them on sections that contain certain kinds of blocks."""
                
                block_types_that_hide_decorations = settings.BLOCK_TYPES_THAT_HIDE_DECORATIONS
                myblocks = section.pageblock_set.all()
                result = not any(b.block().display_name in block_types_that_hide_decorations for b in myblocks)
                return result


            def check_next_page(request, section):
                """ If the logged in user is a participant, checks that the user is allowed to see the next page."""
                
                assert request.user != None
                assert not request.user.is_anonymous()
                assert request.user.is_authenticated()
                
                try:
                    user_participant = request.user.part()
                except AttributeError:
                    user_participant = None
                
                if user_participant == None:
                    return True
                else:
                    #this is a participant. log their visit and double-check they can see the page:
                    participant_can_navigate_to_page = user_participant.log_visit (section, request)
                    if participant_can_navigate_to_page:
                        return True
                    else:
                        # clients can only advance one page at a time.
                        # and must perform each activity's task before proceeding.
                        messages.warning(request, 'Please finish this page before moving forward.')
                        return False
                
            def destination_on_check_next_page_fail (request):
                """Where do we send participants if they fail the check_next_page test?"""
                user_participant = request.user.part() 
                assert user_participant != None
                return user_participant.current_url()



def selenium_teardown():
    """ axe responses, visits. families."""
    users_to_delete, participants_to_delete = [],[]
    #import pdb
    #pdb.set_trace()
    #Participant.objects.get(id_string='9999999')
    participants_to_delete.extend( Participant.objects.filter(id_string='9999999'))
    users_to_delete.extend (p.user for p in participants_to_delete)
    
    #import pdb
    #pdb.set_trace()
    
    for u in users_to_delete:
        u.delete()
    for p in participants_to_delete:
        p.delete()
            
            
@login_required
@rendered_with('wings_main/selenium.html')
def selenium(request,task):
    if not request.user.is_staff:
        return HttpResponseRedirect("/first/")
    
    selenium_teardown()
    if task =='setup':
        sel_message = "proceed"
    
    if task =='teardown':
        sel_message = "success"
    
    return { 'task':task, 'sel_message':sel_message}





@login_required
def first(request):
    """ Just a convenience URL that points at whichever section happens to be the first in the intervention."""
    first_url = Hierarchy.objects.all()[0].get_root().get_first_child().get_absolute_url()
    return HttpResponseRedirect(first_url)
    
@transaction.commit_on_success
def make_and_login_participant(id_string, request):
    """ If there is a participant with this id_string, log them in. If not, create one and log them in.
    See: http://stackoverflow.com/questions/3222549/how-to-automatically-login-a-user-after-registration-in-django
    """
    assert request.user.is_staff #you'd better check before invoking this function.
    participant = get_object_or_404(Participant,id_string=id_string)
    if not participant.user:
        assert participant.user == None # do not mock this line.
        new_user = User()
        new_user.set_unusable_password()
        new_user.username = id_string
        new_user.save()
        participant.user = new_user
        participant.save()
    participant.user.backend='django.contrib.auth.backends.ModelBackend' 
    assert participant.user != None
    messages.info(request, "Logged in!")
    authenticate(username=participant.user.username, password= participant.user.password)
    login(request, participant.user)
    return participant


@login_required
#@rendered_with('wings_main/launch_participant.html')
def launch_participant(request, id_string):
    """Create a new user with a pointer to the participant object. Redirect them to the first page of the intervention. """
    if not request.user.is_staff:
        messages.info(request, "Sorry, you can't launch participants.")
        return HttpResponseRedirect('/first/')
    
    try:
        participant = make_and_login_participant(id_string, request)
    except:
        messages.error(request, "There was a database error; and we could not launch user P%s " % id_string);
        return HttpResponseRedirect('/');
        
    
    if not participant.current_section_id:
        return HttpResponseRedirect('/first/')
    else:
        messages.info(request, "Welcome back!")
        return HttpResponseRedirect(Section.objects.get(id=participant.current_section_id).get_absolute_url())


@login_required
@rendered_with('wings_main/exit_materials.html')
def participant_exit_materials(request):
    return exit_materials_nodes()


@login_required
@rendered_with('wings_main/exit_materials.html')
def exit_materials(request, id_string):
    """   
    logout user (if necessary), log in as a participant, and then show exit materials
    """
    if request.user.is_staff:
        user = make_and_login_participant(id_string, request)
    else:
        user = request.user
    return exit_materials_nodes()
    

def exit_materials_nodes ():
    safety_plan_part_1_node_list = []
    traverse_tree(PageBlock.objects.get(id=127).section, safety_plan_part_1_node_list)

    safety_plan_part_2_node_list = []
    traverse_tree(PageBlock.objects.get(id=135).section, safety_plan_part_2_node_list)

    goal_setting_node_list = []
    traverse_tree(Section.objects.get(id=57), goal_setting_node_list)

    
    ssnm_tree_node    = PageBlock.objects.get(id=254)
    resources_node    = PageBlock.objects.get(id=291)
    
    
    action_plan_node = PageBlock.objects.get(id=257)
    
    #import pdb
    #pdb.set_trace()
    
    return {
        'safety_plan_part_1_node_list' : safety_plan_part_1_node_list,
        'safety_plan_part_2_node_list' : safety_plan_part_2_node_list,
        'goal_setting_node_list'       : goal_setting_node_list,
        'ssnm_tree_node'               : ssnm_tree_node,
        'resources_node'               : resources_node,
        'action_plan_node'             : action_plan_node,
    }



@login_required
@rendered_with('wings_main/summary.html')
def summary(request):
    node_list = []
    traverse_tree( Hierarchy.objects.all()[0].get_root(), node_list)
    return {'tree': node_list}
