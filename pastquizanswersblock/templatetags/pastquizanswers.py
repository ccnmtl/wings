from django import template
from django.utils.html import escape
from quizblock.models import Question, Response, Submission
from servicesblock.models import NarrowedDownAnswer, ServiceProvider
import re
register = template.Library()




def print_if_testing (a):
    if True:
        print a

def match_against_string (response, string_to_match):
    if response.question.is_short_text() or response.question.is_long_text():
        return response.value == string_to_match
    if response.question.is_multiple_choice():
	    return False
    if response.question.is_single_choice() or  response.question.is_single_choice_dropdown():
	    answer_set = response.question.answer_set.all()
	    if not answer_set:
	        return False
	    tmp = dict((r.value, r.label) for r in answer_set)[response.value]        
	    print_if_testing ('found an answer to ' + response.__unicode__())
	    print_if_testing (tmp)
	    return tmp == string_to_match


def to_text (response):
    if response.question.is_multiple_choice():
	    return ''
    if response.question.is_short_text() or response.question.is_long_text():
        return response.value
    if response.question.is_single_choice() or  response.question.is_single_choice_dropdown():
	    answer_set = response.question.answer_set.all()
	    if not answer_set:
	        return ''
	    tmp = dict((r.value, r.label) for r in answer_set)[response.value]   
	    print_if_testing ('found an answer to ' + response.__unicode__())
	    print_if_testing (tmp)  
	    return tmp

@register.simple_tag
def interpolate_previous_answer(user, question_id):
    que = Question.objects.get (id=question_id)
    quiz = que.quiz
    sub = Submission.objects.filter(quiz=quiz,user=user).order_by("-submitted")
    if sub.count() == 0:
        return ''
    submission = sub[0]
    res = Response.objects.filter(question=que,submission=submission)
    if res.count() > 0:
        return escape(to_text(res[0]))
    else:
        return ''
    
    
    
@register.simple_tag
def test_answer (user, question_id, value_to_match, output_if_match, output_if_no_match):
    print_if_testing ('testing %d' % question_id)
    
    que = Question.objects.get (id=question_id)
    if not que:
        return "No question found with id %s" % question_id
    
    quiz = que.quiz
    sub = Submission.objects.filter(quiz=quiz,user=user).order_by("-submitted")
    if sub.count() == 0:
        return output_if_no_match
    submission = sub[0]    
    res = Response.objects.filter(question=que,submission=submission)
    if res.count() > 0 and match_against_string (res[0], value_to_match):
        return output_if_match
    return output_if_no_match
    
