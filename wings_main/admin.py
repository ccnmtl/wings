from models import Participant
from django.contrib import admin

class ParticipantAdmin (admin.ModelAdmin):
    def forest_url_field(self, participant):
        if participant.has_started_intervention():
            return '<a href="/participant/%s/launch/">Relaunch</a>' % participant.id_string
        else:
            return '<a href="/participant/%s/launch/">Start intervention</a>' % participant.id_string
    forest_url_field.allow_tags = True
    forest_url_field.short_description = 'Actions'
    
    class Media:
        css = {
            "all": ("/site_media/css/participant_admin_styles.css",)
        }
        
    list_display = ('label', 'has_started_intervention', 'forest_url_field',)
    fields = ('id_string', ) 
admin.site.register(Participant, ParticipantAdmin)
