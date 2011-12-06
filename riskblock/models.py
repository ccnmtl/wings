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

class RiskBlock(models.Model):
    pageblocks = generic.GenericRelation(PageBlock)
    
    no_risk_copy = models.TextField(blank=True)
    some_risk_copy = models.TextField(blank=True)
    severe_risk_copy = models.TextField(blank=True)
    
    
    template_file = "riskblock/riskblock.html"
    js_template_file = "riskblock/riskblock_js.html"
    css_template_file = "riskblock/riskblock_css.html"

    display_name = "Risk Block"
    
    def risk_level (self):
        return 'severe_risk'

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def edit_form(self):
        class EditForm(forms.Form):
            no_risk_copy = forms.CharField(initial=self.no_risk_copy,
                                          widget=forms.widgets.Textarea())
            some_risk_copy = forms.CharField(initial=self.some_risk_copy,
                                          widget=forms.widgets.Textarea())
            severe_risk_copy = forms.CharField(initial=self.severe_risk_copy,
                                          widget=forms.widgets.Textarea())
        return EditForm()

    def edit(self,vals,files=None):
        self.no_risk_copy = vals.get('no_risk_copy','')
        self.some_risk_copy = vals.get('some_risk_copy','')
        self.severe_risk_copy = vals.get('severe_risk_copy','')
        self.save()

    def dir(self):
        return dir(self)

    @classmethod
    def add_form(self):
        class AddForm(forms.Form):
            no_risk_copy =     forms.CharField(widget=forms.widgets.Textarea())
            some_risk_copy =   forms.CharField(widget=forms.widgets.Textarea())
            severe_risk_copy = forms.CharField(widget=forms.widgets.Textarea())
        return AddForm()

    @classmethod
    def create(self,request):
        return RiskBlock.objects.create(
            no_risk_copy=    request.POST.get('no_risk_copy', ''),
            some_risk_copy=  request.POST.get('some_risk_copy', ''),
            severe_risk_copy=request.POST.get('severe_risk_copy', ''),
        )

    def submit(self,user,data):
        pass

    def redirect_to_self_on_submit(self):
        return True

    def unlocked(self,user):
        return False



