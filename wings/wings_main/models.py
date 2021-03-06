from django.db import models
from django.contrib.auth.models import User
from pagetree.models import Section
from django.contrib import messages


def section_rank(section):
    return [s for s in section.get_tree()].index(section)


class Participant(models.Model):

    id_string = models.BigIntegerField(
        unique=True,
        help_text='ID string should contain exactly 12 digits.')
    created_on = models.DateTimeField(auto_now_add=True, null=False)
    created_by = models.ForeignKey(
        User,
        blank=True,
        null=True,
        related_name='participants_created')
    user = models.ForeignKey(User, blank=True, null=True)
    current_section = models.ForeignKey(Section, blank=True, null=True)

    def __unicode__(self):
        return "%012d" % self.id_string

    def label(self):
        return self.__unicode__()
    label.admin_order_field = 'id_string'
    label.short_description = 'Participant ID'

    def status(self):
        """ a string to give a sense of how far along each participant
        is from the participant list:"""
        if self.current_section is None:
            return "Not started"
        if self.current_section.get_previous() is None:
            return "First page"
        if self.current_section.get_next() is None:
            return "Done"
        s = self.current_section
        for a in range(10):
            if s.get_parent().is_root():
                return s
            s = s.get_parent()
        # this should basically never happen unless sections are nested 10
        # deep.
        return s

    def has_user(self):
        return self.user is not None

    def has_started_intervention(self):
        return self.has_user()
    has_started_intervention.admin_order_field = 'user'

    def current_url(self):
        return self.current_section.get_absolute_url()

    def created_on_string(self):
        return self.created_on.strftime("%a, %B %d,  %Y, %I:%M %p")
    created_on_string.admin_order_field = 'created_on'
    created_on_string.short_description = 'Date created'

    def all_unlocked(self, section, request):
        """for Wings, don't allow participant users to go forward
        until every block on the current page says they're done."""
        user = self.user
        for p in section.pageblock_set.all():
            if hasattr(p.block(), 'unlocked'):
                if not p.block().unlocked(user):
                    # give the block a chance to add an error message to
                    # display to the user:
                    if hasattr(p.block(), 'unlocked_error_message'):
                        the_message = p.block().unlocked_error_message(user)
                        if the_message:
                            messages.warning(request, the_message)
                    return False
        return True

    def log_visit(self, new_section, request):  # TODO pass in the request
        """" return true if it's ok for a participant to see this page.
        set the current section, also,         """

        if self.current_section is None:
            self.current_section = new_section.hierarchy.get_root(
            ).get_first_child(
            )
            self.save()

        old_current_section = self.current_section
        if old_current_section == new_section:
            return True
        if old_current_section.get_next() == new_section:
            # TODO pass in the request
            if not self.all_unlocked(old_current_section, request):
                return (
                    # finish all the work on the old page before you move to
                    # this page.
                    False
                )
            self.current_section = new_section
            self.save()
            return True

        if section_rank(new_section) < section_rank(old_current_section):
            return True  # just navigated back; no big deal

        # new section is more than one step ahead of the old section.
        return False


def traverse_tree(node, the_list):
    the_list.append(node)
    kids = node.get_children()
    for k in kids:
        traverse_tree(k, the_list)

# monkey-patch method:


def user_participant(self):
    try:
        return Participant.objects.get(user=self)
    except Participant.DoesNotExist:
        return None

User.part = user_participant
