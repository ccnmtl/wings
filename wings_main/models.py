from django.db import models
from django.contrib.auth.models import User
from sorl.thumbnail.fields import ImageWithThumbnailsField
from django import forms
from pagetree.models import Section, Hierarchy, PageBlock
from django.conf import settings
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect, HttpResponse, HttpResponseNotFound, HttpRequest

def section_rank (section):
    return [s for s in section.get_tree()].index(section)

class Participant(models.Model):

    id_string = models.IntegerField(unique=True)
    user =  models.ForeignKey(User,blank=True,null=True)
    current_section = models.ForeignKey(Section,blank= True,null=True)

    def label(self):
        return self.__unicode__()

    def __unicode__(self):
        return "P%s" % self.id_string
    __unicode__.admin_order_field = 'id_string'

    def has_user(self):
        return self.user != None
        
    def has_started_intervention(self):
        return self.has_user()
    has_started_intervention.admin_order_field = 'user'
        
    def current_url ( self):
        return self.current_section.get_absolute_url()

    def all_unlocked (self, section):
        """for Wings, don't allow participant users to go forward until every block on the current page says they're done."""
        user = self.user
        for p in section.pageblock_set.all():
           if hasattr(p.block(),'unlocked'):
                 if p.block().unlocked(user) == False:
                     return False
        return True

    def log_visit (self, new_section):
        """" return true if it's ok for a participant to see this page.
        set the current section, also,         """
        
        #this is really helpful. maybe pass this to the template just in case:
        #print "OK JUST FOR DEBUGGING:"
        #print new_section.get_absolute_url()
        #print "ALL UNLOCKED IS"
        #print self.all_unlocked (new_section)
        #print "END DEBUGGING INFO"
        
        if self.current_section == None:
            self.current_section = new_section.hierarchy.get_root().get_first_child()
            self.save()
            
        old_current_section = self.current_section
        if old_current_section == new_section:
            return True
        if old_current_section.get_next() == new_section:
            #print "old.next = new" 
            if not self.all_unlocked (old_current_section):
                return False #finish all the work on the old page before you move to this page.
            self.current_section = new_section
            self.save()
            return True
        
        if section_rank (new_section) < section_rank (old_current_section):
            return True #just navigated back; no big deal
        
        #new section is more than one step ahead of the old section.
        return False     

        
        
def traverse_tree (node, the_list):
    the_list.append(node)
    kids = node.get_children()
    for k in kids:
        traverse_tree(k, the_list)
    
#monkey-patch method:
def user_participant (self):
    try:
        return Participant.objects.get(user=self)
    except Participant.DoesNotExist:
        return None
        
User.part = user_participant
