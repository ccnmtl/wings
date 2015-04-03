from django.test import TestCase
from wings.analytics.models import ActionTaken
from .factories import ActionTypeFactory, UserFactory


class ActionTypeTest(TestCase):
    def test_unicode(self):
        a = ActionTypeFactory()
        self.assertEqual(str(a), 'action type')

    def test_slug(self):
        a = ActionTypeFactory()
        self.assertEqual(a.slug(), 'action-type')


class ActionTakenTest(TestCase):
    def test_log(self):
        a = ActionTypeFactory()
        u = UserFactory()
        at = ActionTaken.log(a, None, u)
        self.assertIsNotNone(at)
