# Django settings for wings project.
import os.path

DEBUG = True
TESTMODE = False
TEMPLATE_DEBUG = DEBUG

ADMINS = ( )

MANAGERS = ADMINS

DATABASE_ENGINE = 'postgresql_psycopg2'
DATABASE_NAME = 'wings'
DATABASE_USER = ''
DATABASE_PASSWORD = ''
DATABASE_HOST = ''
DATABASE_PORT = ''

TIME_ZONE = 'America/New_York'
LANGUAGE_CODE = 'en-us'
SITE_ID = 1
USE_I18N = False



#WHERE ARE THE NON-UPLOADED STATIC FILES?
SITE_MEDIA_ROOT = os.path.join(os.path.dirname(__file__),"site_media")

#WHERE DO UPLOADED STATIC FILES GO ON THE FILESYSTEM?
UPLOADS_ROOT = "/var/www/wings/uploads/"
MEDIA_ROOT = UPLOADS_ROOT


#HOW DO I REFER TO UPLOADED STATIC FILES FROM A TEMPLATE?
MEDIA_URL = '/uploads/'

#ADMIN_MEDIA_PREFIX = '/media/'
#this is set to 'media' by default.

#URL of non-uploaded static files:
SITE_MEDIA_URL = '/site_media'

#path relative to SITE_MEDIA_URL of decoration images used in the intervention:
DECORATION_IMAGE_PATH =  '/img/decoration_images/'

SELENIUM_TESTS_URL = '/site_media/selenium/TestRunner.html'


APPEND_SLASH = False


SECRET_KEY = '^>C}WX)BP5Zs.+T0QW,)(wallaby!"6_t*sm[SIT'
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.load_template_source',
    'django.template.loaders.app_directories.load_template_source',
)


TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.auth',
    'django.core.context_processors.debug',
    'django.core.context_processors.request',
    )

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.middleware.transaction.TransactionMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
)

ROOT_URLCONF = 'wings.urls'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    # Put application templates before these fallback ones:
    "/var/www/wings/templates/",
    os.path.join(os.path.dirname(__file__),"templates"),
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
    'main', #this is actually forest main
    'quizblock',
    #these are new for this project:
    'audioblock',
    'helpblock',
    'ssnmtreeblock',
    'servicesblock',
    'riskblock',
    'pastquizanswersblock',
    #kill sentry
    'wings_main',
    'paging',
    'indexer',
    'south',
)

if not DEBUG:
    tmp = list (INSTALLED_APPS)
    tmp.append ('sentry.client')
    INSTALLED_APPS = tuple (tmp)

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
              
              
BLOCK_TYPES_THAT_HIDE_DECORATIONS = ['Image Block', 'Video Block', 'Social Support Network Tree Block','Services Block', 'Past Quiz Answers Block', 'HTML Block', 'Image Pullquote']

#question_id's for questions that don't require an answer for the user to progress to the next page:
OPTIONAL_QUESTIONS = [222, 235, 162, 168, 240, 242]

#Fake user for the Selenium tests:
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
        SENTRY_KEY = 'NOT_USED_IN_DEV' #overwritten in settings_production.py.
        SENTRY_SITE = 'wings'

THUMBNAIL_SUBDIR = "thumbs"
EMAIL_SUBJECT_PREFIX = "[wings] "
EMAIL_HOST = 'localhost'
SERVER_EMAIL = "wings@ccnmtl.columbia.edu"
