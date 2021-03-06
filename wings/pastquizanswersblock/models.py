from django.db import models
from pagetree.models import PageBlock
from django.contrib.contenttypes.fields import GenericRelation
from django import forms


class PastQuizAnswersBlock(models.Model):
    pageblocks = GenericRelation(PageBlock)
    description = models.TextField(blank=True)
    copy = models.TextField(blank=True)

    template_file = "pastquizanswersblock/pastquizanswersblock.html"
    js_template_file = "pastquizanswersblock/pastquizanswersblock_js.html"
    css_template_file = "pastquizanswersblock/pastquizanswersblock_css.html"

    display_name = "Past Quiz Answers Block"

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def edit_form(self):
        class EditForm(forms.Form):
            description = forms.CharField(
                initial=self.description,
                widget=forms.widgets.Textarea())
            copy = forms.CharField(
                initial=self.copy,
                widget=forms.widgets.Textarea())
        return EditForm()

    def edit(self, vals, files=None):
        self.description = vals.get('description', '')
        self.copy = vals.get('copy', '')
        self.save()

    def dir(self):
        return dir(self)

    @classmethod
    def add_form(self):
        class AddForm(forms.Form):
            description = forms.CharField(widget=forms.widgets.Textarea())
            copy = forms.CharField(widget=forms.widgets.Textarea())
        return AddForm()

    @classmethod
    def create(self, request):
        return PastQuizAnswersBlock.objects.create(
            description=request.POST.get('description', ''),
            copy=request.POST.get('copy', ''),
        )

    def submit(self, user, data):
        pass

    def redirect_to_self_on_submit(self):
        return True

    def unlocked(self, user):
        return True
