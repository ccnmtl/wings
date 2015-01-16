from django.http import HttpResponse
from .models import ActionTaken, ActionType
from pagetree.models import Section


def log_action(request, action_id, section_id):
    the_section = Section.objects.get(pk=section_id)
    the_action = ActionType.objects.get(pk=action_id)
    ActionTaken.log(the_action, the_section, request.user)
    return HttpResponse('{}', content_type='application/json')
