from django.test import TestCase
from django.test.client import Client


class SimpleViewTest(TestCase):
    def setUp(self):
        self.c = Client()

    def test_index(self):
        r = self.c.get("/")
        self.assertEqual(r.status_code, 301)

    def test_participant_admin(self):
        r = self.c.get('/admin/wings_main/participant/')
        self.assertEqual(r.status_code, 200)
