from django.test import TestCase
from .factories import ParticipantFactory


class ParticipantTest(TestCase):
    def test_unicode(self):
        p = ParticipantFactory()
        self.assertEqual(str(p), "%012d" % p.id_string)

    def test_label(self):
        p = ParticipantFactory()
        self.assertEqual(str(p), p.label())

    def test_status(self):
        p = ParticipantFactory()
        self.assertEqual(p.status(), "Not started")

    def test_has_user(self):
        p = ParticipantFactory()
        self.assertFalse(p.has_user())

    def test_has_started_intervention(self):
        p = ParticipantFactory()
        self.assertFalse(p.has_started_intervention())

    def test_created_on_string(self):
        p = ParticipantFactory()
        self.assertEqual(p.created_on_string(),
                         p.created_on.strftime("%a, %B %d,  %Y, %I:%M %p"))
