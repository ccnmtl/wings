from django.contrib.auth.models import User, Group
from django.test import TestCase
from django.test.client import Client
from wings.main.models import Stand


class SimpleViewTest(TestCase):
    def setUp(self):
        self.c = Client()

    def test_index(self):
        r = self.c.get("/")
        self.assertEqual(r.status_code, 301)

    def test_participant_admin(self):
        r = self.c.get('/admin/wings_main/participant/')
        self.assertEqual(r.status_code, 200)


def make_default_tree(stand):
    """ when a new stand is created, we want to populate it
    with at least one Section and a bit of content to get things
    started so the user isn't just presented with a blank page"""
    stand.get_root().add_child_section_from_dict(
        {
            'label': 'Welcome',
            'slug': 'welcome',
            'pageblocks': [
                {'label': 'Welcome to your new Forest Site',
                 'css_extra': '',
                 'block_type': 'Text Block',
                 'body': 'You should now use the edit link to add content',
                 },
            ],
            'children': [
                {
                    'label': 'Second',
                    'slug': 'second',
                    'pageblocks': [
                        {
                            'label': 'Welcome to your new Forest Site',
                            'css_extra': '',
                            'block_type': 'Text Block',
                            'body': ('You should now use the edit '
                                     'link to add content'),
                        },
                    ],
                    'children': [],
                }
            ],
        })


class ViewPageTests(TestCase):
    def setUp(self):
        self.u = User.objects.create(username="testuser", is_staff=True)
        self.u.set_password("test")
        self.u.save()
        self.g = Group.objects.create(name="testgroup")
        self.u.groups.add(self.g)
        # make one that our user can't access
        self.stand = Stand.objects.create(
            title="test stand",
            hostname="test.example.com",
            access="open",
        )
        make_default_tree(self.stand)
        self.c = Client()
        self.c.login(username="testuser", password="test")

    def tearDown(self):
        self.g.delete()
        self.u.delete()
        self.stand.delete()

    def test_post_to_page(self):
        response = self.c.post(
            "/welcome/",
            dict(destination='next'),
            HTTP_HOST="test.example.com")
        self.assertEqual(response.status_code, 302)

    def test_reset_page(self):
        response = self.c.post(
            "/welcome/",
            dict(action="reset", destination='next'),
            HTTP_HOST="test.example.com")
        self.assertEqual(response.status_code, 302)
