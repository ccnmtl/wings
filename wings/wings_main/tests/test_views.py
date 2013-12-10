from django.test import TestCase
from django.test.client import Client
from django.contrib.auth.models import User
from pagetree.models import Hierarchy
from .factories import ParticipantFactory


class SimpleViewTest(TestCase):
    def setUp(self):
        self.c = Client()

    def test_about(self):
        r = self.c.get("/about/")
        self.assertEqual(r.status_code, 200)

    def test_help(self):
        r = self.c.get("/help/")
        self.assertEqual(r.status_code, 200)

    def test_contact(self):
        r = self.c.get("/contact/")
        self.assertEqual(r.status_code, 200)

    def test_credits(self):
        r = self.c.get("/credits/")
        self.assertEqual(r.status_code, 200)

    def test_first(self):
        r = self.c.get("/first/")
        self.assertEqual(r.status_code, 302)

    def test_smoketest(self):
        r = self.c.get('/smoketest/')
        self.assertEqual(r.status_code, 200)


class StaffViewTest(TestCase):
    def setUp(self):
        self.c = Client()
        self.u = User.objects.create(username="test", is_staff=True)
        self.u.set_password("test")
        self.u.save()
        self.c.login(username="test", password="test")
        Hierarchy.objects.create(name="main", base_url="/")

    def test_summary(self):
        r = self.c.get("/summary/")
        self.assertEqual(r.status_code, 200)

    def test_all_answers(self):
        r = self.c.get("/all_answers/")
        self.assertEqual(r.status_code, 200)

    def test_text_answers(self):
        r = self.c.get("/text_answers/")
        self.assertEqual(r.status_code, 200)

    def test_all_answers_key(self):
        r = self.c.get("/all_answers_key/")
        self.assertEqual(r.status_code, 200)

    def test_all_answers_key_table(self):
        r = self.c.get("/all_answers_key_table/")
        self.assertEqual(r.status_code, 200)

    def test_timestamps(self):
        r = self.c.get("/timestamps/")
        self.assertEqual(r.status_code, 200)

    def test_launch_participant(self):
        p = ParticipantFactory()
        r = self.c.get("/participant/%d/launch/" % p.id_string)
        self.assertEqual(r.status_code, 302)
