from django.conf.urls.defaults import *
from django.contrib import admin
from django.conf import settings
import os.path
admin.autodiscover()
import staticmedia

site_media_root = os.path.join(os.path.dirname(__file__),"media")

urlpatterns = patterns('',
    # Example:
    # (r'^wings/', include('wings.foo.urls')),
    
    ('^$','main.views.participant_list'),

    #user crud happens thru django admin for now.
    
    
    #i wonder about participants too...

    #(r'^participant/(?P<id>\d+)/add/','main.views.add_participant'),                       
    #(r'^participant/(?P<id>\d+)/edit/','main.views.edit_participant'),
    #(r'^participant/(?P<id>\d+)/delete/','main.views.delete_participant'),
    #(r'^participant/(?P<id>\d+)/all_answers/','main.views.all_participant_answers'),
    
    #(r'^all_participants/all_answers/','main.views.all_answers'),

    #(r'^selenium/setup/','main.views.selenium_setup'),                       
    #(r'^selenium/run/','main.views.selenium_run'),

    #standard django stuff:
    ('^accounts/',include('djangowind.urls')),
    (r'^admin/(.*)', admin.site.root),
    (r'^munin/',include('munin.urls')),
    (r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': site_media_root}),
(r'^uploads/(?P<path>.*)$','django.views.static.serve',{'document_root' : settings.MEDIA_ROOT}),
) + staticmedia.serve()

