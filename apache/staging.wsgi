import os, sys, site

site.addsitedir('/var/www/capsim/capsim/ve/lib/python2.7/site-packages')

# paths we might need to pick up the project's settings
sys.path.append('/var/www/wings/wings/')

os.environ['DJANGO_SETTINGS_MODULE'] = 'wings.settings_staging'

import django.core.handlers.wsgi
import django
django.setup()

application = django.core.handlers.wsgi.WSGIHandler()
