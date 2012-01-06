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


    if response.question.is_single_choice():
        return dict((r.value, r.label) for r in response.question.answer_set.all())[response.value]

    if response.question.is_multiple_choice():
        assert 1 == 0 # not implementing this in Wings.

@register.simple_tag
def interpolate_previous_answers(user, block):
    print user
    print block.copy
    #import pdb
    #pdb.set_trace()
    
    
    
    def find_the_response (matches):
        que = Question.objects.get (id=matches.groups()[0])
        u = user
        quiz = que.quiz
        sub = Submission.objects.filter(quiz=quiz,user=u).order_by("-submitted")
        if sub.count() == 0:
            return ''
        submission = sub[0]
        res = Response.objects.filter(question=que,submission=submission)
        if res.count() > 0:
            #import pdb
            #pdb.set_trace()
            return to_text(res[0])
        else:
            return ''
            
            
            
    
    return re.sub("\[\[\[(\d+)\]\]\]", find_the_response, block.copy)
    
    
    
def narrow_down(context):
    user = context['user']
    question = Question.objects.get (id=context['question_id'])
    nda, created = NarrowedDownAnswer.objects.get_or_create(user=user, question=question )
    nda.save()
    responses = question.user_responses (context['user'])
    pageblock_id = context['pageblock_id']
    return {
        'checked_responses'    : [q.value for q in responses],
        'question'             : question,
        'responses'            : responses,
        'pageblock_id'         : pageblock_id,
        'narrowed_down_answer' : nda,
    }
register.inclusion_tag('servicesblock/narrow_down.html', takes_context=True)(narrow_down)



def show_narrowed_down_answer(context):
    question = Question.objects.get (id=context['question_id'])
    nda, created = NarrowedDownAnswer.objects.get_or_create(user=context['user'], question=question )
    nda.save()
    return { 'narrowed_down_answer' : nda }
register.inclusion_tag('servicesblock/show_narrowed_down_answer.html', takes_context=True)(show_narrowed_down_answer)



def show_related_resources(context):
    question = Question.objects.get (id=context['question_id'])
    nda, created = NarrowedDownAnswer.objects.get_or_create(user=context['user'], question=question )
    nda.save()
    return { 
        'resources' : ServiceProvider.objects.filter(issue = nda.answer)
    }
register.inclusion_tag('servicesblock/show_related_resources.html', takes_context=True)(show_related_resources)




