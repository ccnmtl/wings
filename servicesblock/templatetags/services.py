from django import template
from quizblock.models import Question, Response, Submission

register = template.Library()
def narrow_down(context):
    question = Question.objects.get (id=context['question_id'])
    responses = question.user_responses (context['user'])
    pageblock_id = context['pageblock_id']
    return {
        'checked_responses' : [q.value for q in responses],
        'question'          : question,
        'responses'         : responses,
        'pageblock_id'      : pageblock_id,
    }


register.inclusion_tag('servicesblock/narrow_down.html', takes_context=True)(narrow_down)
