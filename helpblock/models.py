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


class HelpBlock(models.Model):
    pageblocks = generic.GenericRelation(PageBlock)
    description = models.TextField(blank=True)
    audio_file = models.FileField(upload_to='audio_block', blank=True, null=True)
    
    template_file =     "helpblock/helpblock.html"
    js_template_file =  "helpblock/helpblock_js.html"
    css_template_file = "helpblock/helpblock_css.html"
    
    display_name =      "Help Block"

    def is_help_block(self):
        return True

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def edit_form(self ):
        class EditForm(forms.Form):
            description = forms.CharField(initial=self.description, widget=forms.widgets.Textarea(), label="Help Block Transcript")
            audio_file = forms.FileField(label="Replace audio file:")
            if False:
                current_path = settings.MEDIA_ROOT + "/"  + self.audio_file
                alt_text = "<strong>Current audio file:</strong>  <a href = \"%s\">%s</a>" % (current_path, current_path)
            current_path =    self.audio_file
            alt_text = "<strong>Current audio file:</strong>  %s" % ( current_path)
        return EditForm()

    def edit(self,vals,files=None):
        self.description = vals.get('description','')
        if files.has_key('audio_file'):
            self.save_audio_file (files['audio_file'])
        self.save()

    def dir(self):
        return dir(self)

    @classmethod
    def add_form(self):
        class AddForm(forms.Form):
            description = forms.CharField(widget=forms.widgets.Textarea())
            audio_file = forms.FileField(label="Replace audio file:")
        return AddForm()
        
    @classmethod
    def create(self,request):
        return HelpBlock.objects.create(description=request.POST.get('description', ''))

    def submit(self,user,data):
        pass

    def redirect_to_self_on_submit(self):
        return True

    def unlocked(self,user):
        return True
        
    def save_audio_file(self,f):
        ext = f.name.split(".")[-1].lower()
        basename = slugify(f.name.split(".")[-2].lower())[:40]
        if ext not in ['mp3']:
            # unsupported image format
            return None
        now = datetime.now()
        path = "audio_file/%04d/%02d/%02d/" % (now.year,now.month,now.day)


        try:
            os.makedirs(settings.MEDIA_ROOT + "/" + path)
        except:
            pass
        full_filename = path + "%s.%s" % (basename,ext)
        fd = open(settings.MEDIA_ROOT + "/" + full_filename,'wb')
        for chunk in f.chunks():
            fd.write(chunk)
        fd.close()
        self.audio_file = full_filename
        self.save()

