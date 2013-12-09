from models import ServiceProvider
from django.contrib import admin


class ServiceProviderAdmin (admin.ModelAdmin):
    list_display = ('issue', 'id', 'name',)
    fields = ('issue', 'name', 'phone', 'url', 'address', 'description')
admin.site.register(ServiceProvider, ServiceProviderAdmin)
