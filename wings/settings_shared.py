# Django settings for wings project.
import os.path
import sys

DEBUG = True
TEMPLATE_DEBUG = DEBUG

ADMINS = ()

MANAGERS = ADMINS

ALLOWED_HOSTS = ['.ccnmtl.columbia.edu', 'localhost']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'wings',
        'HOST': '',
        'PORT': 5432,
        'USER': '',
        'PASSWORD': '',
    }
}

if 'test' in sys.argv or 'jenkins' in sys.argv:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': ':memory:',
            'HOST': '',
            'PORT': '',
            'USER': '',
            'PASSWORD': '',
        }
    }

TEST_RUNNER = 'django.test.runner.DiscoverRunner'

JENKINS_TASKS = (
    'django_jenkins.tasks.run_pep8',
    'django_jenkins.tasks.run_pyflakes',
)
PROJECT_APPS = [
    'wings.main',
    'wings.analytics',
    'wings.helpblock',
    'wings.pastquizanswersblock',
    'wings.quizblock',
    'wings.riskblock',
    'wings.servicesblock',
    'wings.ssnmtreeblock',
    'wings.wings_main',
]

TIME_ZONE = 'America/New_York'
LANGUAGE_CODE = 'en-us'
SITE_ID = 1
USE_I18N = False


# WHERE ARE THE NON-UPLOADED STATIC FILES?
SITE_MEDIA_ROOT = os.path.join(os.path.dirname(__file__), "../media/")

# WHERE DO UPLOADED STATIC FILES GO ON THE FILESYSTEM?
UPLOADS_ROOT = "/var/www/wings/uploads/"
MEDIA_ROOT = UPLOADS_ROOT


# HOW DO I REFER TO UPLOADED STATIC FILES FROM A TEMPLATE?
MEDIA_URL = '/uploads/'

# URL of non-uploaded static files:
SITE_MEDIA_URL = '/media/'

# path relative to SITE_MEDIA_URL of decoration images used in the
# intervention:
DECORATION_IMAGE_PATH = '/img/decoration_images/'

SELENIUM_TESTS_URL = '/media/selenium/TestRunner.html'


APPEND_SLASH = False


SECRET_KEY = '^>C}WX)BP5Zs.+T0QW,)(wallaby!"6_t*sm[SIT'
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)


TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.request',
    "django.contrib.auth.context_processors.auth",
    "django.core.context_processors.debug",
    "django.core.context_processors.i18n",
    "django.core.context_processors.media",
    "django.contrib.messages.context_processors.messages",
    'django.core.context_processors.static',
    'djangowind.context.context_processor',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.middleware.transaction.TransactionMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
    'django_statsd.middleware.GraphiteRequestTimingMiddleware',
    'django_statsd.middleware.GraphiteMiddleware',
    'waffle.middleware.WaffleMiddleware',
)

ROOT_URLCONF = 'wings.urls'

TEMPLATE_DIRS = (
    os.path.join(os.path.dirname(__file__), "templates"),
)

INSTALLED_APPS = [
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.flatpages',
    'django.contrib.admin',
    'django.contrib.staticfiles',
    'sorl.thumbnail',
    'smartif',
    'pagetree',
    'pageblocks',
    'wings.main',  # this is actually forest main
    'wings.quizblock',
    'audioblock',
    'wings.helpblock',
    'wings.ssnmtreeblock',
    'wings.servicesblock',
    'wings.riskblock',
    'wings.pastquizanswersblock',
    'wings.analytics',
    'wings.wings_main',
    'paging',
    'indexer',
    'django_statsd',
    'django_jenkins',
    'smoketest',
    'waffle',
    'django_markwhat',
]
STATIC_URL = "/media/"
STATIC_ROOT = ""
STATICFILES_DIRS = (
    os.path.join(os.path.dirname(__file__), "../media"),
)

STATSD_CLIENT = 'statsd.client'
STATSD_PREFIX = 'wings'
STATSD_HOST = 'localhost'
STATSD_PORT = 8125

PAGEBLOCKS = ['pageblocks.TextBlock',
              'pageblocks.HTMLBlock',
              'pageblocks.PullQuoteBlock',
              'pageblocks.ImageBlock',
              'pageblocks.ImagePullQuoteBlock',
              'quizblock.Quiz',
              'audioblock.AudioBlock',
              'helpblock.HelpBlock',
              'ssnmtreeblock.SsnmTreeBlock',
              'servicesblock.ServicesBlock',
              'riskblock.RiskBlock',
              'pastquizanswersblock.PastQuizAnswersBlock',
              ]


BLOCK_TYPES_THAT_HIDE_DECORATIONS = [
    'Image Block',
    'Video Block',
    'Social Support Network Tree Block',
    'Services Block',
    'Past Quiz Answers Block',
    'HTML Block',
    'Image Pullquote']

# question_id's for questions that don't require an answer for the user to
# progress to the next page:
OPTIONAL_QUESTIONS = [222, 235, 162, 168, 240, 242]

# Fake user for the Selenium tests:
SELENIUM_TEST_USER_ID = 999999999999

THUMBNAIL_SUBDIR = "thumbs"
EMAIL_SUBJECT_PREFIX = "[wings] "
EMAIL_HOST = 'localhost'
SERVER_EMAIL = "wings@ccnmtl.columbia.edu"

LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
}

# Hard Coded ids.
#
# These should not exist.
#
# getting them into the config here is at least an improvement over
# having them hard-coded in the application and a step towards fixing
# this problem. At least now they can be overridden for unit tests

SAFETY_PLAN_PART_1_ID = 127
SAFETY_PLAN_PART_2_ID = 135
GOAL_SETTING_SECTION_ID = 57
STEPS_TO_INCREASE_SUPPORT_SECTION_ID = 215
SSNM_TREE_NODE_ID = 254
RESOURCES_NODE_ID = 291
ACTION_PLAN_NODE_ID = 257

REALLY_DEPRESSING_SECTION_IDS = [100, 53]
HIDE_TITLE_SECTION_IDS = [97, 53]

SEVERE_RISK_NUMBERS = [515, 517, 523, 538, 539, 540, 552, 553, 554, 555]

SOME_RISK_ANSWERS = [
    499,
    501,
    503,
    505,
    507,
    509,
    519,
    521,
    532,
    533,
    534,
    535,
    542,
    543,
    544,
    545,
    547,
    548,
    549,
    550,
    557,
    558,
    559,
    560,
    562,
    563,
    564,
    565,
    567,
    568,
    569,
    570]
