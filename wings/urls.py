import django.views.static

from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.views.generic import RedirectView
from wings.wings_main.views import (
    background, first, all_answers, text_answers, all_answers_key,
    all_answers_key_table, timestamps, summary, launch_participant,
    exit_materials, participant_exit_materials
)
from wings.analytics.views import log_action
from pagetree.views import move_section
from wings.main.views import page, edit_page

admin.autodiscover()

urlpatterns = [
    url('^$', RedirectView.as_view(url='/admin/wings_main/participant/')),
    url('^accounts/login/$',
        RedirectView.as_view(url='/admin/wings_main/participant/')),
    url('^login/$',
        RedirectView.as_view(url='/admin/wings_main/participant/')),
    url('^accounts/profile/$',
        RedirectView.as_view(url='/admin/wings_main/participant/')),


    url('^about/$', background, {'content_to_show': 'about'}),
    url('^help/$', background, {'content_to_show': 'help'}),
    url('^contact/$', background, {'content_to_show': 'contact'}),
    url('^credits/$', background, {'content_to_show': 'credits'}),
    url('^logout/$', RedirectView.as_view(url='/admin/logout/')),

    # shortcut to first page of the
    url('^first/$', first),

    # giant table of all answers from all participants
    url('^all_answers/$', all_answers),
    url('^text_answers/$', text_answers),
    url('^all_answers_key/$', all_answers_key),
    url('^all_answers_key_table/$', all_answers_key_table),
    url('^timestamps/$', timestamps),

    # summary of all pages
    url('^summary/$', summary),

    # start the participant off:
    url(r'^participant/(?P<id_string>\d+)/launch/', launch_participant),

    # exit materials for a particular participant (meant to be accessed by the
    # facilitator from the list of participants)
    url(r'^participant/(?P<id_string>\d+)/exit_materials/', exit_materials),

    # exit materials for the logged in user:
    url(r'^exit_materials/', participant_exit_materials),

    url(r'^pagetree/', include('pagetree.urls')),
    url(r'^_quiz/', include('wings.quizblock.urls')),

    # Logging clicks on UI elements via AJAX:
    url(r'^log_action/(?P<action_id>\d+)/on_section/(?P<section_id>\d+)/$',
        log_action),

    # standard django stuff:
    url('^accounts/', include('djangowind.urls')),
    url(r'^admin/pagetree/section/move/(?P<section_id>\d+)/$', move_section,
        {}, 'move-section'),

    url(r'^admin/', include(admin.site.urls)),

    url('^smoketest/', include('smoketest.urls')),

    url(r'^uploads/(?P<path>.*)$', django.views.static.serve,
        {'document_root': settings.UPLOADS_ROOT}),

    # from forest:
    # Put this after the static files, otherwise it will try
    # to serve them.
    url(r'^edit/(?P<path>.*)$', edit_page, {}, 'edit-page'),
    url(r'^(?P<path>.*)$', page),
]
