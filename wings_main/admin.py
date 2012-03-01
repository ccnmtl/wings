from models import Participant
from pagetree.models import Section
from django.contrib import admin
class ParticipantAdmin (admin.ModelAdmin):

    def forest_url_field(self, participant):
        ids = participant.id_string
        launch_url = "/participant/%s/launch/" % ids
        
        
        if participant.has_started_intervention() and participant.current_section_id != None:
            #RELAUNCH:
            push_state_url = Section.objects.get(id=participant.current_section_id).get_absolute_url()
            relaunch_js_href = "javascript:set_no_admin_and_go (\'%s\',  \'%s\')" % (push_state_url, launch_url)
            go_button = '<a href="%s" class="relaunch_button" >Relaunch</a>' % relaunch_js_href
            exit_materials_url = "/participant/%s/exit_materials/" % ids
            exit_materials_button = '<a href="%s" class="exit_materials_button" >Exit materials</a>' % exit_materials_url
        else:
            #START INTERVENTION:
            push_state_url = '/first/'
            launch_js_href = "javascript:set_no_admin_and_go (\'%s\',  \'%s\')" % (push_state_url, launch_url)
            go_button = '<a href="%s" class="start_intervention_button" id="launch_%s"  >Start intervention</a>' % (launch_js_href, ids)
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
