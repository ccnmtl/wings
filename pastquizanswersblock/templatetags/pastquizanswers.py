from django import template
from quizblock.models import Question, Response, Submission
from servicesblock.models import NarrowedDownAnswer, ServiceProvider
import re

register = template.Library()



#'is_long_text', 'is_multiple_choice', 'is_short_text', 'is_single_choice', 'is_single_choice_dropdown'

def to_text (response):
    if response.question.is_short_text():
        return response.value
    if response.question.is_long_text():
        return response.value
    if response.question.is_multiple_choice():
	return "Multiple choice question: not implemented."
    if response.question.is_single_choice() or  response.question.is_single_choice_dropdown():
	answer_set = response.question.answer_set.all()
	if answer_set:
	    return dict((r.value, r.label) for r in answer_set)[response.value]
	else:
	    return 'No answer'

@register.simple_tag
def interpolate_previous_answers(user, block):

    def find_the_response (matches):
        """For each match, look up the question and return a text version of the answer to that question. TODO: make "no answer" error message an argument to this method."""
        que = Question.objects.get (id=matches.groups()[0])
        quiz = que.quiz
        sub = Submission.objects.filter(quiz=quiz,user=user).order_by("-submitted")
        if sub.count() == 0:
            return 'No answer'
        submission = sub[0]
        res = Response.objects.filter(question=que,submission=submission)
        if res.count() > 0:
            return to_text(res[0])
        else:
            return 'No answer'

    #substitute triple-bracketed integers with the response to the question with the interger's ID.
    return re.sub("\[\[\[(\d+)\]\]\]", find_the_response, block.copy)    

