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


#WHERE DO UPLOADED STATIC FILES GO ON THE FILESYSTEM?
UPLOADS_ROOT = "/var/www/wings/uploads/" # /uploads URLS point to this.
MEDIA_ROOT = UPLOADS_ROOT

#HOW DO I REFER TO UPLOADED STATIC FILES FROM A TEMPLATE?
MEDIA_URL = '/uploads/'

#ADMIN_MEDIA_PREFIX = '/media/'
#this is set to 'media' by default.


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
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
    'django.middleware.transaction.TransactionMiddleware',
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
    'exitmaterialsblock',
    
    'sentry.client',
    'wings_main',
    'south',
)

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
              'exitmaterialsblock.ExitMaterialsBlock',
              ]

import logging
logger = logging.getLogger()
from sentry.client.handlers import SentryHandler
if SentryHandler not in map(lambda x: x.__class__, logger.handlers):
    logger.addHandler(SentryHandler())
    logger = logging.getLogger('sentry.errors')
    logger.propagate = False
    logger.addHandler(logging.StreamHandler())
    
    SENTRY_REMOTE_URL = 'http://sentry.ccnmtl.columbia.edu/sentry/store/'
    SENTRY_KEY = 'this_is_just_for_dev6411E157C4ED1660' #overwritten in settings_production.py.
    SENTRY_SITE = 'wings'

THUMBNAIL_SUBDIR = "thumbs"
EMAIL_SUBJECT_PREFIX = "[wings] "
EMAIL_HOST = 'localhost'
SERVER_EMAIL = "wings@ccnmtl.columbia.edu"

#disabling this until I know exactly what it does.
# put any static media here to override app served static media
#STATICMEDIA_MOUNTS = (
#    ('/sitemedia', 'sitemedia'),
#)

# WIND settings

#Todo: kill all these. We don't want wind.
AUTHENTICATION_BACKENDS = ('djangowind.auth.WindAuthBackend','django.contrib.auth.backends.ModelBackend',)
WIND_BASE = "https://wind.columbia.edu/"
WIND_SERVICE = "cnmtl_full_np"
WIND_PROFILE_HANDLERS = ['djangowind.auth.CDAPProfileHandler']
WIND_AFFIL_HANDLERS = ['djangowind.auth.AffilGroupMapper','djangowind.auth.StaffMapper','djangowind.auth.SuperuserMapper']
WIND_STAFF_MAPPER_GROUPS = ['tlc.cunix.local:columbia.edu']
WIND_SUPERUSER_MAPPER_GROUPS = ['anp8','jb2410','zm4','sbd12','egr2107','kmh2124','sld2131','amm8','mar227','ed2198', 'ej2223']


