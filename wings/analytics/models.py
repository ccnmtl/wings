from django.db import models
from pagetree.models import Section
from wings.wings_main.models import section_rank
from wings.wings_main.views import is_descendent_of

from django.contrib.auth.models import User
import json
from django.template.defaultfilters import slugify


class ActionType (models.Model):

    def __unicode__(self):
        return self.label
    label = models.CharField(blank=True, null=True, max_length=64)

    def slug(self):
        return slugify(self.label)

    @classmethod
    def summary(self):
        result = dict((action_type.slug(), action_type.id)
                      for action_type in ActionType.objects.all())
        return json.dumps(result)


class ActionTaken (models.Model):

    """An entry in an analytics-type log. Records who took an action,
    the time it happened, and the page it happened on."""
    user = models.ForeignKey(User, help_text="User who took the action")
    action = models.ForeignKey(
        ActionType,
        help_text=("Description of the action logged. First word should "
                   "be a verb in the past tense, third person."))
    section = models.ForeignKey(
        Section,
        help_text="On what page?",
        verbose_name="Where?",
        blank=True,
        null=True)
    when = models.DateTimeField(
        auto_now_add=True,
        null=False,
        verbose_name='When?')

    class Meta:
        ordering = ['user', '-when']
        #ordering = ['-when']

        verbose_name_plural = "Actions taken"

    @classmethod
    def log(self, action, section, user):
        new_point = ActionTaken()
        new_point.action = action
        new_point.section = section
        new_point.user = user
        new_point.save()
        return new_point

    def page_type(self):
        """Added in latter days to help Jess with some research on the
        use of audio by the participants"""
        safety_plan = Section.objects.get(id=56)
        if is_descendent_of(self.section, [safety_plan]):
            return "safety plan"
        if any(s.block().display_name == 'Quiz'
               for s in self.section.pageblock_set.all()):
            return "quiz"
        return "long text"

    def page_rank(self):
        return section_rank(self.section)
