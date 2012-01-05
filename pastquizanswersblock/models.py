from django.db import models
from pagetree.models import PageBlock
from django.contrib.auth.models import User
from django.contrib.contenttypes import generic
from django import forms
from datetime import datetime
from django.core.urlresolvers import reverse
from django.template.defaultfilters import slugify
from django.conf import settings
import os, json

class PastQuizAnswersBlock(models.Model):
    pageblocks = generic.GenericRelation(PageBlock)
    description = models.TextField(blank=True)
    copy = models.TextField(blank=True)
    
    template_file = "pastquizanswers/pastquizanswers.html"
    js_template_file = "pastquizanswers/pastquizanswers_js.html"
    css_template_file = "pastquizanswers/pastquizanswers_css.html"

    display_name = "Past Quiz Answers Block"

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def edit_form(self):
        class EditForm(forms.Form):
            description = forms.CharField(initial=self.description,
                                          widget=forms.widgets.Textarea())
           

    def edit(self,vals,files=None):
        self.description = vals.get('description','')
        self.save()

    def dir(self):
        return dir(self)

    @classmethod
    def add_form(self):
        class AddForm(forms.Form):
            description = forms.CharField(widget=forms.widgets.Textarea())
        return AddForm()

    @classmethod
    def create(self,request):
        return PastQuizAnswersBlock.objects.create(description=request.POST.get('description', ''))

    def submit(self,user,data):
        pass

    def redirect_to_self_on_submit(self):
        return True

    def unlocked(self,user):
        return False


