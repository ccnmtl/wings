from main.models import Participant
from django.contrib import admin

class ParticipantAdmin (admin.ModelAdmin):
    def forest_url_field(self, participant):
        return '<a href="http://wings.forest.ccnmtl.columbia.edu/introduction/?participant_id=%s">Start intervention</a>' % participant.id_string
    forest_url_field.allow_tags = True
    forest_url_field.short_description = 'Actions'


    class Media:
        css = {
            "all": ("/site_media/css/participant_admin_styles.css/",)
        }
        
    list_display=('id_string','active', 'forest_url_field',)
    fields = ('id_string', ) 

admin.site.register(Participant, ParticipantAdmin)
