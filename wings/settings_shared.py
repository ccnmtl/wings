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

SOUTH_TESTS_MIGRATE = False
TEST_RUNNER = 'django_nose.NoseTestSuiteRunner'
NOSE_ARGS = [
    'django_nose',
    '--cover-package=wings',
]

TIME_ZONE = 'America/New_York'
LANGUAGE_CODE = 'en-us'
SITE_ID = 1
USE_I18N = False


# WHERE ARE THE NON-UPLOADED STATIC FILES?
SITE_MEDIA_ROOT = os.path.join(os.path.dirname(__file__), "../site_media")

# WHERE DO UPLOADED STATIC FILES GO ON THE FILESYSTEM?
UPLOADS_ROOT = "/var/www/wings/uploads/"
MEDIA_ROOT = UPLOADS_ROOT


# HOW DO I REFER TO UPLOADED STATIC FILES FROM A TEMPLATE?
MEDIA_URL = '/uploads/'

#ADMIN_MEDIA_PREFIX = '/media/'
# this is set to 'media' by default.

# URL of non-uploaded static files:
SITE_MEDIA_URL = '/site_media'

# path relative to SITE_MEDIA_URL of decoration images used in the
# intervention:
DECORATION_IMAGE_PATH = '/img/decoration_images/'

SELENIUM_TESTS_URL = '/site_media/selenium/TestRunner.html'


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
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.middleware.transaction.TransactionMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
    'django_statsd.middleware.GraphiteRequestTimingMiddleware',
    'django_statsd.middleware.GraphiteMiddleware',
)

ROOT_URLCONF = 'wings.urls'

TEMPLATE_DIRS = (
    os.path.join(os.path.dirname(__file__), "templates"),
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.flatpages',
    'django.contrib.markup',
    'django.contrib.admin',
    'staticmedia',
    'sorl.thumbnail',
    'tagging',
    'smartif',
    'template_utils',
    'typogrify',
    'munin',
    'pagetree',
    'pageblocks',
    'wings.main',  # this is actually forest main
    'wings.quizblock',
    'wings.audioblock',
    'wings.helpblock',
    'wings.ssnmtreeblock',
    'wings.servicesblock',
    'wings.riskblock',
    'wings.pastquizanswersblock',
    'wings.analytics',
    'wings.wings_main',
    'paging',
    'indexer',
    'south',
    'django_nose',
    'django_statsd',
)

STATSD_CLIENT = 'statsd.client'
STATSD_PATCHES = ['django_statsd.patches.db', ]
STATSD_PREFIX = 'wings'
STATSD_HOST = 'localhost'
STATSD_PORT = 8125

if not DEBUG:
    tmp = list(INSTALLED_APPS)
    tmp.append('sentry.client')
    INSTALLED_APPS = tuple(tmp)

PAGEBLOCKS = ['pageblocks.TextBlock',
              'pageblocks.HTMLBlock',
              'pageblocks.PullQuoteBlock',
              'pageblocks.ImageBlock',
              'pageblocks.ImagePullQuoteBlock',
              'wings.quizblock.Quiz',
              'wings.audioblock.AudioBlock',
              'wings.helpblock.HelpBlock',
              'wings.ssnmtreeblock.SsnmTreeBlock',
              'wings.servicesblock.ServicesBlock',
              'wings.riskblock.RiskBlock',
              'wings.pastquizanswersblock.PastQuizAnswersBlock',
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

if 'sentry.client' in INSTALLED_APPS:
    import logging
    logger = logging.getLogger()
    from sentry.client.handlers import SentryHandler
    if SentryHandler not in map(lambda x: x.__class__, logger.handlers):
        logger.addHandler(SentryHandler())
        logger = logging.getLogger('sentry.errors')
        logger.propagate = False
        logger.addHandler(logging.StreamHandler())

        SENTRY_REMOTE_URL = 'http://sentry.ccnmtl.columbia.edu/sentry/store/'
        # overwritten in settings_production.py.
        SENTRY_KEY = 'NOT_USED_IN_DEV'
        SENTRY_SITE = 'wings'

THUMBNAIL_SUBDIR = "thumbs"
EMAIL_SUBJECT_PREFIX = "[wings] "
EMAIL_HOST = 'localhost'
SERVER_EMAIL = "wings@ccnmtl.columbia.edu"
