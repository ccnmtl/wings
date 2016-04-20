# Django settings for wings project.
import os.path
from ccnmtlsettings.shared import common

project = 'wings'
base = os.path.dirname(__file__)
locals().update(common(project=project, base=base))

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

# path relative to SITE_MEDIA_URL of decoration images used in the
# intervention:
DECORATION_IMAGE_PATH = '/img/decoration_images/'

SELENIUM_TESTS_URL = '/media/selenium/TestRunner.html'

APPEND_SLASH = False

INSTALLED_APPS += [  # noqa
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
]

PAGEBLOCKS = [
    'pageblocks.TextBlock',
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
    'Image Pullquote',
]

# urls.py really needs to be cleaned up to eliminate these:
UPLOADS_ROOT = "/var/www/wings/uploads/"
SITE_MEDIA_ROOT = os.path.join(os.path.dirname(__file__), "../media/")
SITE_MEDIA_URL = '/media/'

# question_id's for questions that don't require an answer for the user to
# progress to the next page:
OPTIONAL_QUESTIONS = [222, 235, 162, 168, 240, 242]

# Fake user for the Selenium tests:
SELENIUM_TEST_USER_ID = 999999999999

THUMBNAIL_SUBDIR = "thumbs"

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
    570,
]
