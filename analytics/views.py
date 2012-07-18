from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.core.urlresolvers import reverse
from analytics.models import ActionTaken, ActionType
from pagetree.models import PageBlock, Section


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

#Logging clicks on UI elements via AJAX:
#(r'^log_action/(?P<action_id>\d+)/on_page/(?P<pageblock_id>\d+)/$', 'analytics.views.log_action')

def log_action(request, action_id, section_id):
    #print action_id
    #print pageblock_id
    
    
    
    the_section = Section.objects.get  (pk = section_id)
    the_action = ActionType.objects.get (pk = action_id   )
    
    
    #import pdb
    #pdb.set_trace()
    
    
    ActionTaken.log ( the_action, the_section, request.user)
    
    return HttpResponse('{}', mimetype='application/json')

    if 1 == 0:
            results = {'success':False}
            if request.method == 'GET':
                the_get = request.GET
                if the_get.has_key('pk') and the_get.has_key('vote'):
                    pk = int(the_get['pk'])
                    vote = the_get['vote']
                    poll = Poll.objects.get(pk=pk)
                    if vote == "up":
                        poll.up()
                    elif vote == "down":
                        poll.down()
                    results = {'success':True}
            json = simplejson.dumps(results)
    return HttpResponse(json, mimetype='application/json')
