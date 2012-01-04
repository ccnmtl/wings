from django import template
from quizblock.models import Question, Response, Submission
from servicesblock.models import NarrowedDownAnswer, ServiceProvider

register = template.Library()


def narrow_down(context):
    user = context['user']
    question = Question.objects.get (id=context['question_id'])
    nda = NarrowedDownAnswer.objects.get (user = user, question = question)
    
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
    nda = NarrowedDownAnswer.objects.get (user = context['user'], question = question)
    return { 'narrowed_down_answer' : nda }
register.inclusion_tag('servicesblock/show_narrowed_down_answer.html', takes_context=True)(show_narrowed_down_answer)



def show_related_resources(context):
    question = Question.objects.get (id=context['question_id'])
    nda = NarrowedDownAnswer.objects.get (user = context['user'], question = question)
    #import pdb
    #pdb.set_trace()
    return { 
        'resources' : ServiceProvider.objects.filter(issue = nda.answer)
    }
register.inclusion_tag('servicesblock/show_related_resources.html', takes_context=True)(show_related_resources)
