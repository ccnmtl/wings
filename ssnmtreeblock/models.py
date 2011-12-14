from django.db import models
from pagetree.models import PageBlock
from django.contrib.auth.models import User
from django.contrib.contenttypes import generic
from django import forms
from django.conf import settings
import os, json

from django.forms.fields import ChoiceField, MultipleChoiceField
from django.forms.widgets import RadioSelect, CheckboxSelectMultiple

SSNM_PAGE_TYPE_CHOICES = (
    (u'page_1', u'Choose names'), #choose the names
    (u'page_2', u'Emotional support'), #emotional support  
    (u'page_3', u'Practical support'), #practical support
    (u'page_e', u'Error page'), #error page / prompt for no names
)
    
class SsnmTreeBlock(models.Model):
    pageblocks = generic.GenericRelation(PageBlock)
    error_copy = models.TextField(blank=True, null=True)
    page_type =  models.TextField( choices=SSNM_PAGE_TYPE_CHOICES, default='page_1') 
    
    #text boxes on the tree:
    boxes = models.ManyToManyField ('SsnmTreeBox')
    
    editable_support_types    = models.ManyToManyField ('SsnmTreeSupportType', blank=True, null=True, related_name='blocks_where_you_can_edit_this_support_type', help_text ="Support Types you can *edit* on this page.")

    visible_support_types    = models.ManyToManyField ('SsnmTreeSupportType', blank=True, null=True,  related_name='blocks_where_you_can_see_this_support_type', help_text ="Support Types you can *see* on this page.")
     
    template_file =     "ssnmtreeblock/ssnmtreeblock.html"
    js_template_file =  "ssnmtreeblock/ssnmtreeblock_js.html"
    css_template_file = "ssnmtreeblock/ssnmtreeblock_css.html"
    display_name = "Social Support Network Tree Block"
    
    class Meta:
        verbose_name = 'SSNM Tree: Page Block'
        verbose_name_plural = 'SSNM Tree: Page Blocks'
        
    def dir(self):
        return dir(self)

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def needs_submit(self):
        return True

    def edit_form(self):
        class EditForm(forms.Form):
            error_copy = forms.CharField(initial=self.error_copy, widget=forms.widgets.Textarea())
            page_type = forms.ChoiceField(required=True, initial=self.page_type, widget=RadioSelect, choices=SSNM_PAGE_TYPE_CHOICES)
        return EditForm()

    def edit(self,vals,files=None):
        self.error_copy = vals.get('error_copy','')
        self.page_type = vals.get('page_type','')
        self.save()

    @classmethod
    def add_form(self):
        class AddForm(forms.Form):
            error_copy =       forms.CharField(widget=forms.widgets.Textarea())
            page_type =        forms.ChoiceField(required=True,  widget=RadioSelect, choices=SSNM_PAGE_TYPE_CHOICES)
        return AddForm()

    @classmethod
    def create(self,request):
        return SsnmTreeBlock.objects.create(
            error_copy=    request.POST.get('error_copy', ''),
            page_type=     request.POST.get('page_type', ''),
        )

    def submit(self,user,data):
        for box in self.boxes.all():
            person_name = data.get (unicode(box.id), '')
            assert person_name != None
            box = SsnmTreeBox.objects.get(pk = box.id)
            assert box != None
            person, created = SsnmTreePerson.objects.get_or_create(tree_box=box, user=user)
            assert person != None
            person.name = person_name
            person.save()
            for the_type in self.editable_support_types.all():
                key = 'box_%d_type_%d' % (box.id, the_type.id)
                if data.get (key, '') == 'on':
                    person.support_types.add(the_type)
                    person.save()
                    assert the_type in person.support_types.all()

    def redirect_to_self_on_submit(self):
        return True

    def unlocked(self,user):
        return True

    class Meta:
        verbose_name = 'SSNM Tree Block'
        verbose_name_plural = 'SSNM Tree Blocks'


class SsnmTreeBox(models.Model):
    """ A text box on a tree."""
    def __unicode__(self):
        return  u"%s ( %d , %d)"% (self.label, self.pixels_from_left, self.pixels_from_top)
    label            = models.TextField(blank=True, null=True, unique=True)
    pixels_from_left = models.IntegerField( default = 0)
    pixels_from_top  = models.IntegerField( default= 0)

    def name (self, user):
         """ The name of the person the user typed into this box"""
         person, created = SsnmTreePerson.objects.get_or_create(tree_box=self, user=user)
         return person.name
    
    def support_types_for_user_and_block(self, user, block):
        """ convenience method: returns space-separated css classes for front end """
        person, created = SsnmTreePerson.objects.get_or_create(tree_box=self, user=user)
        return ' '.join ('offers_support_type_%d' %st.id for st in person.support_types.all())
    
    class Meta:
        verbose_name = 'SSNM Tree: Text Box'
        verbose_name_plural = 'SSNM Tree: Text Boxes'
        
    def dir(self):
        return dir(self)


class SsnmTreeSupportType (models.Model):
    """Such as e.g. "practical" or "emotional". There can be more. """
    label            = models.TextField(blank=True, null=True, unique=True)
    description      = models.TextField(blank=True, null=True)
    
    class Meta:
        verbose_name_plural = 'SSNM Tree: Type of Support'
        verbose_name_plural = 'SSNM Tree: Types of Support'

    def __unicode__(self):
        return unicode(self.label)
        
    def dir(self):
        return dir(self)


class  SsnmTreePerson (models.Model):
    """Somebody that a user knows. Shows up in a particular box on that user's tree. Can be recorded as providing one or more types of support to the user."""
    user             = models.ForeignKey( User)
    tree_box         = models.ForeignKey( SsnmTreeBox)
    name             = models.TextField(blank=True, null=True, default='')
    support_types    = models.ManyToManyField (SsnmTreeSupportType)
    unique_together = (("user", "tree_box"),)
    
    class Meta:
        verbose_name_plural = 'SSNM Tree: Person'
        verbose_name = 'SSNM Tree: People'

    def dir(self):
        return dir(self)
        
