from models import Participant
from django.contrib import admin

class ParticipantAdmin (admin.ModelAdmin):

    def forest_url_field(self, participant):
        ids = participant.id_string
        if participant.has_started_intervention():
            go_button = '<a href="/participant/%s/launch/" class="relaunch_button" >Relaunch</a>' % ids
            exit_materials_button = '<a href="/participant/%s/exit_materials/" class="exit_materials_button" >Exit materials</a>' % ids
        else:
            go_button = '<a href="/participant/%s/launch/" class="start_intervention_button" >Start intervention</a>' % ids
            exit_materials_button = ''
        return "%s %s" % (go_button, exit_materials_button)
       
    forest_url_field.allow_tags = True
    forest_url_field.short_description = 'Actions'
    
    class Media:
        css = {
            "all": ("/site_media/css/participant_admin_styles.css",)
        }
    list_display = ( 'label', 'created_on_string',  'has_started_intervention', 'forest_url_field',)
    fields = ('id_string', ) 
admin.site.register(Participant, ParticipantAdmin)
