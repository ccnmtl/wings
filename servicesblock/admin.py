from models import ServiceProvider
from django.contrib import admin
class ServiceProviderAdmin (admin.ModelAdmin):
    list_display = ('issue', 'id', 'name',)
    fields = ('issue', 'name','phone', 'url', 'address', 'map_image')  
admin.site.register(ServiceProvider, ServiceProviderAdmin)
