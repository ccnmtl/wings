from django.test import TestCase
from django.test.client import Client
from django.contrib.auth.models import User
from pagetree.models import Hierarchy


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
