from django.db import models
from pagetree.models import PageBlock
from quizblock.models import Answer, Question
from django.contrib.auth.models import User
from django.contrib.contenttypes import generic
from django import forms
from datetime import datetime
from django.core.urlresolvers import reverse
from django.template.defaultfilters import slugify
from django.conf import settings
from django.forms.widgets import RadioSelect, CheckboxSelectMultiple
import os, json

SERVICES_PAGE_TYPE_CHOICES = (
    (u'page_1', u'Drill down 1'), #choose the names
    (u'page_2', u'Drill down 2'), #emotional support
)

class ServicesBlock(models.Model):
    pageblocks = generic.GenericRelation(PageBlock)
    description = models.TextField(blank=True)
    
    template_file =     "servicesblock/servicesblock.html"
    js_template_file =  "servicesblock/servicesblock_js.html"
    css_template_file = "servicesblock/servicesblock_css.html"
    
    page_type =  models.TextField( choices=SERVICES_PAGE_TYPE_CHOICES, default='page_1') 
    
    display_name = "Services Block"

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def needs_submit(self):
        return True

    def edit_form(self):
        class EditForm(forms.Form):
            description = forms.CharField(initial=self.description, widget=forms.widgets.Textarea())
            page_type   = forms.ChoiceField(required=True, initial=self.page_type, widget=RadioSelect, choices=SERVICES_PAGE_TYPE_CHOICES)
        return EditForm()

    def edit(self,vals,files=None):
        self.description = vals.get('description','')
        self.page_type =   vals.get('page_type','')
        self.save()
        

    def dir(self):
        return dir(self)

    @classmethod
    def add_form(self):
        class AddForm(forms.Form):
            description = forms.CharField(widget=forms.widgets.Textarea())
            page_type =   forms.ChoiceField(required=True, initial=self.page_type, widget=RadioSelect, choices=SERVICES_PAGE_TYPE_CHOICES)
        return AddForm()

    @classmethod
    def create(self,request):
        return ServicesBlock.objects.create(
            description=   request.POST.get('description', ''),
            page_type=     request.POST.get('page_type', ''),
        )


    def submit(self,user,data):
        for q, a_id  in data.iteritems():
            if 'narrowed_down_question_id' in q:
                qid_str = q.split ('_')[-1]
                the_question = Question.objects.get (id=qid_str)
                the_answer   =   Answer.objects.get (id=a_id)
                narrowed_down_answer, created = NarrowedDownAnswer.objects.get_or_create(question=the_question, user=user)
                narrowed_down_answer.answer = the_answer
                narrowed_down_answer.save()
        
    def redirect_to_self_on_submit(self):
        return True

    def unlocked(self,user):
        if self.page_type == 'page_1':
            return NarrowedDownAnswer.objects.filter(user=user)[0].answer != None

        if self.page_type == 'page_2':
            #print 'ok np not checking on page 2 -- is read only'
            return True
 
        
    def unlocked_error_message (self, user):
        if self.page_type == 'page_1':
            return 'Please pick the service that would be most helpful to you.'
        return None
        
        
class NarrowedDownAnswer (models.Model):
    """This is to record which of a multiple-choice, multiple-answer question (i.e. checkboxes) a user chose as the most important one."""
    user             = models.ForeignKey( User)
    question         = models.ForeignKey( Question, default = None)
    answer           = models.ForeignKey( Answer, null=True)
    unique_together = (("user", "question"),)
    
    class Meta:
        verbose_name_plural = 'Services: Narrowed Down Answers'
        verbose_name =        'Services: Narrowed Down Answer'

    def dir(self):
        return dir(self)

class ServiceProvider(models.Model):
    issue = models.ForeignKey         (Answer,     null=True, limit_choices_to = {'question__id': 241})
    name = models.TextField           (blank=True, null=True)
    phone = models.TextField          (blank=True, null=True)
    url = models.TextField            (blank=True, null=True)
    address = models.TextField        (blank=True, null=True)
    description = models.TextField    (blank=True, null=True, help_text = "One-sentence description of the service")
    map_image = models.ImageField(upload_to="images/", blank=True, null=True)
    
    
    def dir(self):
        return dir(self)

