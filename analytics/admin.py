from models import ActionType, ActionTaken
from pagetree.models import Section
from django.contrib import admin
from django.contrib.admin.views.main import ChangeList


class ActionTypeAdmin (admin.ModelAdmin):
    list_display =  (  'label',)
    fields       =  (  'label',)
admin.site.register(ActionType, ActionTypeAdmin)

class ActionTakenAdmin (admin.ModelAdmin):
    list_display = (  'user','action','section', 'when', 'page_rank', 'page_type')
    fields       = (  'user','action','section')
    list_per_page = 2000
    actions = None
    
    # don't show the links to the user in the list display
    def __init__(self, *args, **kwargs):
        super(ActionTakenAdmin, self).__init__(*args, **kwargs)
        self.list_display_links = (None, )
        
    def get_changelist(self, request, **kwargs): 
        return SpecialOrderingChangeList


class SpecialOrderingChangeList(ChangeList): 
    """ 
     Django 1.3 ordering problem workaround 
     from 1.4 it's enough to use `ordering` variable 
    """ 
    def get_query_set(self): 
        queryset = super(SpecialOrderingChangeList, self).get_query_set() 
        return queryset.order_by(*self.model._meta.ordering) 


admin.site.register(ActionTaken, ActionTakenAdmin)
