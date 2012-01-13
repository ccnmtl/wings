from django.conf.urls.defaults import *
from django.contrib import admin
from django.conf import settings
from django.views.generic.simple import redirect_to

import os.path
admin.autodiscover()
import staticmedia

urlpatterns = patterns('',
    
    #TODO use a proper reverse:
    ('^$', redirect_to, {'url': '/admin/wings_main/participant/'}),
    
    ('^admin/login/$', redirect_to, {'url': '/admin/wings_main/participant/'}),   
    ('^accounts/login/$', redirect_to, {'url': '/admin/wings_main/participant/'}),   
    ('^login/$', redirect_to, {'url': '/admin/wings_main/participant/'}),   
    ('^logout/$', redirect_to, {'url': '/admin/logout/'}), 
    
    #shortcut to first page 
    ('^first/$', 'wings_main.views.first'),



    
    #summary of all pages 
    ('^summary/$', 'wings_main.views.summary'),

    (r'^participant/(?P<id_string>\d+)/launch/',           'wings_main.views.launch_participant'),                     
    (r'^participant/(?P<id_string>\d+)/exit_materials/',   'wings_main.views.exit_materials'),                     

                   
    (r'^exit_materials/',   'wings_main.views.participant_exit_materials'),

    (r'^pagetree/',include('pagetree.urls')),
    (r'^_quiz/',include('quizblock.urls')),


    (r'^test$',    redirect_to,  {'url': settings.SELENIUM_TESTS_URL}),
    (r'^tests$',   redirect_to,  {'url': settings.SELENIUM_TESTS_URL}),
    (r'^test/$',   redirect_to,  {'url': settings.SELENIUM_TESTS_URL}),
    (r'^tests/$',  redirect_to,  {'url': settings.SELENIUM_TESTS_URL}),
    

    
    (r'^selenium/(?P<task>\w+)/$',               'wings_main.views.selenium'),

        

    #standard django stuff:
    ('^accounts/',include('djangowind.urls')),
    (r'^admin/pagetree/section/move/(?P<section_id>\d+)/$', 'pagetree.views.move_section', {}, 'move-section'),
    (r'^admin/(.*)', admin.site.root),
    (r'^munin/',include('munin.urls')),

    # Note: this is nonstandard, but the standard is incredibly confusing to mere mortals.
    # I'm sorry, but for this site, urls in "site_media"  will reference directory "site_media".
    (r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.SITE_MEDIA_ROOT }),
    (r'^uploads/(?P<path>.*)$','django.views.static.serve',{'document_root' : settings.UPLOADS_ROOT}),

    #from forest:
    #Put this after the static files, otherwise it will try to serve them.
    (r'^edit/(?P<path>.*)$','main.views.edit_page',{},'edit-page'),
    (r'^(?P<path>.*)$','main.views.page'),
    

) + staticmedia.serve()

