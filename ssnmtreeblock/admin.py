from models import SsnmTreeBlock, SsnmTreeBox, SsnmTreeSupportType, SsnmTreePerson
from django.contrib import admin

class SsnmTreeBlockAdmin (admin.ModelAdmin):
    list_display = ('pageblock', 'error_copy',)
    fields = ('error_copy', 'boxes','support_types',)    
admin.site.register(SsnmTreeBlock, SsnmTreeBlockAdmin)    

class SsnmTreeBoxAdmin (admin.ModelAdmin):
    list_display = ('label', 'pixels_from_top', 'pixels_from_left',)
    fields = ('label', 'pixels_from_top', 'pixels_from_left',)
admin.site.register(SsnmTreeBox, SsnmTreeBoxAdmin)

class SsnmTreeSupportTypeAdmin (admin.ModelAdmin):
    list_display = ('label', 'description',)
    fields = ('label', 'description',)
admin.site.register(SsnmTreeSupportType, SsnmTreeSupportTypeAdmin)
