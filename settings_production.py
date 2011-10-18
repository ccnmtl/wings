from settings_shared import *

TEMPLATE_DIRS = (
    "/var/www/wings/wings/templates",
)

MEDIA_ROOT = '/var/www/wings/uploads/'
# put any static media here to override app served static media
STATICMEDIA_MOUNTS = (
    ('/sitemedia', '/var/www/wings/wings/sitemedia'),	
)


DEBUG = False
TEMPLATE_DEBUG = DEBUG

try:
    from local_settings import *
except ImportError:
    pass
