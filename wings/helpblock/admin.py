from models import HelpBlock
from django.contrib import admin


class HelpBLockAdmin (admin.ModelAdmin):
    list_display = ('audio_file',)
    fields = ('audio_file',)
admin.site.register(HelpBlock, HelpBLockAdmin)
