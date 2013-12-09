from django.template import RequestContext
from django.http import HttpResponse
from django.shortcuts import render_to_response
from .analytics.models import ActionTaken, ActionType
from pagetree.models import Section


class rendered_with(object):

    def __init__(self, template_name):
        self.template_name = template_name

    def __call__(self, func):
        def rendered_func(request, *args, **kwargs):
            items = func(request, *args, **kwargs)
            if isinstance(items, type({})):
                return (
                    render_to_response(
                        self.template_name,
                        items,
                        context_instance=RequestContext(request))
                )
            else:
                return items
        return rendered_func


def log_action(request, action_id, section_id):
    the_section = Section.objects.get(pk=section_id)
    the_action = ActionType.objects.get(pk=action_id)
    ActionTaken.log(the_action, the_section, request.user)
    return HttpResponse('{}', mimetype='application/json')
