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
import os, json

class ServicesBlock(models.Model):
    pageblocks = generic.GenericRelation(PageBlock)
    description = models.TextField(blank=True)
    
    template_file = "servicesblock/servicesblock.html"
    js_template_file = "servicesblock/servicesblock_js.html"
    css_template_file = "servicesblock/servicesblock_css.html"
    
    display_name = "Services Block"

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def needs_submit(self):
        return True

    def edit_form(self):
        class EditForm(forms.Form):
            description = forms.CharField(initial=self.description,
                                          widget=forms.widgets.Textarea())
        return EditForm()

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
        return ServicesBlock.objects.create(description=request.POST.get('description', ''))

    def submit(self,user,data):
        #print "hi"
        print self
        print data
        #import pdb
        #pdb.set_trace()
        for q, a_id  in data.iteritems():
            if 'narrowed_down_question_id' in q:
                qid_str = q.split ('_')[-1]
                the_question = Question.objects.get (id=qid_str)
                the_answer   =   Answer.objects.get (id=a_id)
        
                print q
                print qid_str
                print a_id
                print the_question
                print the_answer

                import pdb
                pdb.set_trace()
                #narrowed_down_answer, created = NarrowedDownAnswer.objects.get_or_create(question=the_question, user=user, answer = the_answer)
                narrowed_down_answer, created = NarrowedDownAnswer.objects.get_or_create(question=the_question, user=user)
                narrowed_down_answer.answer = the_answer
                narrowed_down_answer.save()
                
                
                print NarrowedDownAnswer.objects.all()
        
    def redirect_to_self_on_submit(self):
        return True

    def unlocked(self,user):
        return False
        



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

#Data sturcture:
#        most_important_issue_chosen
#           value
#           question
#           user

#       services_to_show:
#               issue
#               Name
#               Phone
#               URL
#               street address
#               map image
