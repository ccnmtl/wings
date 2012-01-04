from models import ServiceProvider
from django.contrib import admin
class ServiceProviderAdmin (admin.ModelAdmin):
    list_display = ('issue', 'id', 'name',)
    fields = ('issue', 'name','phone', 'url', 'address', 'map_image')  
admin.site.register(ServiceProvider, ServiceProviderAdmin)    


if 1 == 2:

    issue = models.ForeignKey     (Answer,     null=True)
    name = models.TextField       (blank=True, null=True)
    phone = models.TextField      (blank=True, null=True)
    url = models.TextField        (blank=True, null=True)
    address = models.TextField    (blank=True, null=True)
    map_image = models.ImageField(upload_to="images/")

if 1 == 0:
    class SsnmTreeBlockAdmin (admin.ModelAdmin):
        list_display = ('pageblock', 'error_copy',)
        fields = ('error_copy', 'boxes','editable_support_types', 'visible_support_types')    
    admin.site.register(SsnmTreeBlock, SsnmTreeBlockAdmin)    

    class SsnmTreeBoxAdmin (admin.ModelAdmin):
        list_display = ('label', 'pixels_from_top', 'pixels_from_left',)
        fields = ('label', 'pixels_from_top', 'pixels_from_left',)
    admin.site.register(SsnmTreeBox, SsnmTreeBoxAdmin)

    class SsnmTreeSupportTypeAdmin (admin.ModelAdmin):
        list_display = ('label', 'description',)
        fields = ('label', 'description',)
    admin.site.register(SsnmTreeSupportType, SsnmTreeSupportTypeAdmin)
