# flake8: noqa
from settings_shared import *
from ccnmtlsettings.staging import common

locals().update(
    common(
        project=project,
        base=base,
        STATIC_ROOT=STATIC_ROOT,
        INSTALLED_APPS=INSTALLED_APPS,
        s3static=False,
    ))

# we want smoketests to pass on staging without caring whether
# these exact answers all actually exist
SEVERE_RISK_NUMBERS = []
SOME_RISK_ANSWERS = []

try:
    from local_settings import *
except ImportError:
    pass
