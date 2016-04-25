from django import template
from django.utils.html import escape
from wings.quizblock.models import Question, Response, Submission, Answer
register = template.Library()


def match_against_string(response, string_to_match):
    if response.question.is_short_text() or response.question.is_long_text():
        return response.value == string_to_match
    if response.question.is_multiple_choice():
        return False
    if (response.question.is_single_choice() or
            response.question.is_single_choice_dropdown()):
        answer_set = response.question.answer_set.all()
        if not answer_set:
            return False
        tmp = dict((r.value, r.label) for r in answer_set)[response.value]
        return tmp == string_to_match


def to_text(response):
    if response.question.is_multiple_choice():
        return ''
    if response.question.is_short_text() or response.question.is_long_text():
        return response.value
    if (response.question.is_single_choice() or
            response.question.is_single_choice_dropdown()):
        answer_set = response.question.answer_set.all()
        if not answer_set:
            return ''
        tmp = dict((r.value, r.label) for r in answer_set)[response.value]
        return tmp


@register.simple_tag
def interpolate_previous_answer(user, question_id):
    que = Question.objects.get(id=question_id)
    quiz = que.quiz
    sub = Submission.objects.filter(
        quiz=quiz,
        user=user).order_by("-submitted")
    if sub.count() == 0:
        return ''
    submission = sub[0]
    res = Response.objects.filter(question=que, submission=submission)
    if res.count() > 0:
        return escape(to_text(res[0]))
    else:
        return ''


@register.simple_tag
def test_answer(user, question_id, value_to_match,
                output_if_match, output_if_no_match):

    que = Question.objects.get(id=question_id)
    if not que:
        return "No question found with id %s" % question_id

    quiz = que.quiz
    sub = Submission.objects.filter(
        quiz=quiz,
        user=user).order_by("-submitted")
    if sub.count() == 0:
        return output_if_no_match
    submission = sub[0]
    res = Response.objects.filter(question=que, submission=submission)
    if res.count() > 0 and match_against_string(res[0], value_to_match):
        return output_if_match
    return output_if_no_match

# These are used on the stats page (/all_answers/)
# TODO: a bit of refactoring. this is just a quick version.


def use_title(shown, hover):
    return (
        "<span class='stats_page_stat' title = '%s'>%s</span>" % (hover, shown)
    )


def to_number(response):
    if response.question.is_multiple_choice():
        return use_title('n/a', 'multiple_choice')
    if response.question.is_short_text() or response.question.is_long_text():
        return use_title('str', response.value)
    if (response.question.is_single_choice() or
            response.question.is_single_choice_dropdown()):
        answer_set = response.question.answer_set.all()
        if not answer_set:
            return use_title('n/a', 'no_answers2')

        set_of_answers = dict((r.value, r.label) for r in answer_set)

        try:
            tmp = set_of_answers[response.value]

        except KeyError:
            # print ' key error'
            # print ' question is ', response.question
            # print ' set of answers is ', set_of_answers
            # print ' response is ', response
            # print ' response.id is ', response.id
            # print ' response.value is ', response.value
            return use_title('???', '???')

        return use_title(response.value, tmp)


@register.simple_tag
def answer_code_for_stats(user, question_id):
    que = Question.objects.get(id=question_id)
    quiz = que.quiz
    sub = Submission.objects.filter(
        quiz=quiz,
        user=user).order_by("-submitted")
    if sub.count() == 0:
        return (
            # SPSS convention: -9 means "no data."
            use_title('-9', 'no_submission')
        )
    submission = sub[0]
    res = Response.objects.filter(question=que, submission=submission)
    if res.count() > 0:
        the_answer = res[0].corresponding_answer()
        if que.is_single_choice():
            return use_title(the_answer.numeric_value, the_answer.label)
        else:
            return res[0].value
    else:
        return use_title('-9', 'no_answer')


@register.simple_tag
def user_checked_this_answer(user, answer_id):
    answer = Answer.objects.get(id=answer_id)
    quiz = answer.question.quiz
    sub = Submission.objects.filter(
        quiz=quiz,
        user=user).order_by("-submitted")
    if sub.count() == 0:
        return (
            # SPSS convention: -9 means "no data."
            use_title('-9', 'no_submission')
        )
    if sub[0].contains_answer(answer):
        return use_title('1', 'checked')
    else:
        return use_title('0', 'not checked')
