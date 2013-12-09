from models import AudioBlock
from django.contrib import admin


class AudioBLockAdmin (admin.ModelAdmin):
    list_display = ('audio_file',)
    fields = ('audio_file',)
admin.site.register(AudioBlock, AudioBLockAdmin)
