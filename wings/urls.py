from django.conf.urls.defaults import patterns, include, url
from django.contrib import admin
from django.conf import settings
from django.views.generic.simple import redirect_to

admin.autodiscover()
import staticmedia

urlpatterns = patterns(
    '',

    ('^$', redirect_to,
     {'url': '/admin/wings_main/participant/'}),
    ('^admin/login/$', redirect_to,
     {'url': '/admin/wings_main/participant/'}),
    ('^accounts/login/$', redirect_to,
     {'url': '/admin/wings_main/participant/'}),
    ('^login/$', redirect_to,
     {'url': '/admin/wings_main/participant/'}),
    ('^accounts/profile/$', redirect_to,
     {'url': '/admin/wings_main/participant/'}),


    ('^about/$', 'wings.wings_main.views.background',
     {'content_to_show': 'about'}),
    ('^help/$', 'wings.wings_main.views.background',
     {'content_to_show': 'help'}),
    ('^contact/$', 'wings.wings_main.views.background',
     {'content_to_show': 'contact'}),
    ('^credits/$', 'wings.wings_main.views.background',
     {'content_to_show': 'credits'}),
    ('^logout/$', redirect_to,
     {'url': '/admin/logout/'}),

    # shortcut to first page of the
    ('^first/$', 'wings.wings_main.views.first'),

    # giant table of all answers from all participants
    ('^all_answers/$', 'wings.wings_main.views.all_answers'),
    ('^text_answers/$', 'wings.wings_main.views.text_answers'),
    ('^all_answers_key/$',
     'wings.wings_main.views.all_answers_key'),
    ('^all_answers_key_table/$',
     'wings.wings_main.views.all_answers_key_table'),
    ('^timestamps/$', 'wings.wings_main.views.timestamps'),

    # summary of all pages
    ('^summary/$', 'wings.wings_main.views.summary'),

    # start the participant off:
    (r'^participant/(?P<id_string>\d+)/launch/',
     'wings.wings_main.views.launch_participant'),

    # exit materials for a particular participant (meant to be accessed by the
    # facilitator from the list of participants)
    (r'^participant/(?P<id_string>\d+)/exit_materials/',
     'wings.wings_main.views.exit_materials'),

    # exit materials for the logged in user:
    (r'^exit_materials/',
     'wings.wings_main.views.participant_exit_materials'),

    (r'^pagetree/', include('pagetree.urls')),
    (r'^_quiz/', include('wings.quizblock.urls')),


    (r'^test$', redirect_to,
     {'url': settings.SELENIUM_TESTS_URL}),
    (r'^tests$', redirect_to,
     {'url': settings.SELENIUM_TESTS_URL}),
    (r'^test/$', redirect_to,
     {'url': settings.SELENIUM_TESTS_URL}),
    (r'^tests/$', redirect_to,
     {'url': settings.SELENIUM_TESTS_URL}),

    (r'^selenium/(?P<task>\w+)/$',
     'wings.wings_main.views.selenium'),

    # Logging clicks on UI elements via AJAX:
    (r'^log_action/(?P<action_id>\d+)/on_section/(?P<section_id>\d+)/$',
     'wings.analytics.views.log_action'),

    # standard django stuff:
    ('^accounts/', include('djangowind.urls')),
    (r'^admin/pagetree/section/move/(?P<section_id>\d+)/$',
     'pagetree.views.move_section', {}, 'move-section'),


    url(r'^admin/', include(admin.site.urls)),
    (r'^munin/', include('munin.urls')),

    ('^smoketest/$', include('smoketest.urls')),

    (r'^uploads/(?P<path>.*)$', 'django.views.static.serve',
     {'document_root': settings.UPLOADS_ROOT}),

    # from forest:
    # Put this after the static files, otherwise it will try
    # to serve them.
    (r'^edit/(?P<path>.*)$',
     'wings.main.views.edit_page', {}, 'edit-page'),
    (r'^(?P<path>.*)$', 'wings.main.views.page'),


) + staticmedia.serve()
