from models import ActionType, ActionTaken
from pagetree.models import Section
from django.contrib import admin

class ActionTypeAdmin (admin.ModelAdmin):
    list_display =  (  'label',)
    fields       =  (  'label',)
admin.site.register(ActionType, ActionTypeAdmin)

class ActionTakenAdmin (admin.ModelAdmin):
    list_display = (  'user','action','section', 'when')
    fields       = (  'user','action','section')
    list_per_page = 2000
    actions = None
admin.site.register(ActionTaken, ActionTakenAdmin)
