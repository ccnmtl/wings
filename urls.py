from django.conf.urls.defaults import *
from django.contrib import admin
from django.conf import settings
from django.views.generic.simple import redirect_to

import os.path
admin.autodiscover()
import staticmedia

site_media_root = os.path.join(os.path.dirname(__file__),"site_media")

urlpatterns = patterns('',
    
    #TODO use a proper reverse:
    ('^$', redirect_to, {'url': '/admin/wings_main/participant/'}),

    #user crud happens thru django admin for now.

    
    (r'^participant/(?P<id_string>\d+)/launch/',   'wings_main.views.launch_participant'),                       
    (r'^participant/(?P<id_string>\d+)/land/',     'wings_main.views.land_participant'),
    
    
    # for now these are taken care of by django admin.
    
    #(r'^participant/(?P<id>\d+)/add/',            'wings_main.views.add_participant'),                       
    #(r'^participant/(?P<id>\d+)/edit/',           'wings_main.views.edit_participant'),
    #(r'^participant/(?P<id>\d+)/delete/',         'wings_main.views.delete_participant'),
    #(r'^participant/(?P<id>\d+)/all_answers/',    'wings_main.views.all_participant_answers'),
    
    (r'^pagetree/',include('pagetree.urls')),
    (r'^_quiz/',include('quizblock.urls')),

    #(r'^all_participants/all_answers/','main.views.all_answers'),

    #(r'^selenium/setup/','main.views.selenium_setup'),                       
    #(r'^selenium/run/','main.views.selenium_run'),

    #standard django stuff:
    ('^accounts/',include('djangowind.urls')),
    (r'^admin/(.*)', admin.site.root),
    (r'^munin/',include('munin.urls')),
    
    #from forest:
    (r'^edit/(?P<path>.*)$','main.views.edit_page',{},'edit-page'),
    (r'^instructor/(?P<path>.*)$','main.views.instructor_page'),
    


    # Note: this is nonstandard, but the standard is confusing.
    # For this site: "site_media"  points at "site_media".
    (r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': site_media_root }),
    (r'^uploads/(?P<path>.*)$','django.views.static.serve',{'document_root' : settings.UPLOADS_ROOT}),

        
    

    #Put this after the static files, otherwise it will try to serve them.
    (r'^(?P<path>.*)$','main.views.page'),
    #changing this to our version of page:
    #(r'^(?P<path>.*)$','wings_main.views.wings_page'),
    

) + staticmedia.serve()

