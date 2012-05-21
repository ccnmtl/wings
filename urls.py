from django.conf.urls.defaults import *
from django.contrib import admin
from django.conf import settings
from django.views.generic.simple import redirect_to

import os.path
admin.autodiscover()
import staticmedia

urlpatterns = patterns('',
    
    ('^$',                redirect_to, {'url': '/admin/wings_main/participant/'}),
    ('^admin/login/$',    redirect_to, {'url': '/admin/wings_main/participant/'}),   
    ('^accounts/login/$', redirect_to, {'url': '/admin/wings_main/participant/'}),
    ('^login/$',          redirect_to, {'url': '/admin/wings_main/participant/'}),   
    
    
    ('^about/$',   'wings_main.views.background',  {'content_to_show': 'about'  }),
    ('^help/$',    'wings_main.views.background',  {'content_to_show': 'help'   }),
    ('^contact/$', 'wings_main.views.background',  {'content_to_show': 'contact'}),
    ('^credits/$', 'wings_main.views.background',  {'content_to_show': 'credits'}),
    ('^logout/$',   redirect_to,                   {'url': '/admin/logout/'     }), 
    
    #shortcut to first page of the 
    ('^first/$', 'wings_main.views.first'),
    
    #giant table of all answers from all participants 
    ('^all_answers/$',     'wings_main.views.all_answers'),
    ('^text_answers/$',    'wings_main.views.text_answers'),
    ('^all_answers_key/$', 'wings_main.views.all_answers_key'),
    ('^all_answers_key_table/$', 'wings_main.views.all_answers_key_table'),
    
    #summary of all pages 
    ('^summary/$', 'wings_main.views.summary'),
    
    #start the participant off:
    (r'^participant/(?P<id_string>\d+)/launch/',           'wings_main.views.launch_participant'),                     
    
    #exit materials for a particular participant (meant to be accessed by the facilitator from the list of participants)
    (r'^participant/(?P<id_string>\d+)/exit_materials/',   'wings_main.views.exit_materials'),                     
    
    #exit materials for the logged in user:
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

    # This is nonstandard, but the standard is confusing.
    # I'm sorry, but for this site, urls in "site_media"  will reference directory "site_media".
    (r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {'document_root':  settings.SITE_MEDIA_ROOT }),
    (r'^uploads/(?P<path>.*)$',    'django.views.static.serve', {'document_root' : settings.UPLOADS_ROOT    }),

    #from forest:
    #Put this after the static files, otherwise it will try to serve them.
    (r'^edit/(?P<path>.*)$','main.views.edit_page',{},'edit-page'),
    (r'^(?P<path>.*)$','main.views.page'),
    

) + staticmedia.serve()

