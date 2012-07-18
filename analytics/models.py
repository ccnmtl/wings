from django.db import models
from pagetree.models import Section
from django.contrib.auth.models import User
from django.contrib.contenttypes import generic
from django import forms
from datetime import datetime
from django.core.urlresolvers import reverse
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from django.utils import simplejson
from django.http import HttpResponse, HttpResponseRedirect
from django.template.defaultfilters import slugify


import os, json

class ActionType (models.Model):    
    def __unicode__(self):
        return self.label
    label =  models.CharField(blank=True, null=True, max_length = 64)

    def slug(self):
        return slugify (self.label)
    
    @classmethod
    def summary(self):
        result = dict((action_type.slug(), action_type.id) for action_type in ActionType.objects.all())
        return simplejson.dumps(result)

    


class ActionTaken (models.Model):
    """An entry in an analytics-type log. Records who took an action, the time it happened, and the page it happened on."""
    user =  models.ForeignKey(User, help_text="User who took the action")
    action = models.ForeignKey(ActionType, help_text="Description of the action logged. First word should be a verb in the past tense, third person.")
    section =  models.ForeignKey(Section, help_text="On what page?", verbose_name = "Where?", blank = True, null=True)
    when = models.DateTimeField(auto_now_add=True, null=False, verbose_name = 'When?')

    class Meta:
        ordering = ['user', 'section', '-when']
        verbose_name_plural = "Actions taken"

    @classmethod
    def log(self, action, section, user):
        new_point = ActionTaken()
        new_point.action = action
        new_point.section = section
        new_point.user = user
        new_point.save()
        return new_point




