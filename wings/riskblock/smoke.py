from django.conf import settings
from wings.quizblock.models import Answer
from smoketest import SmokeTest


class MagicNumbers(SmokeTest):
    def test_severe_risk_numbers(self):
        all_there = True
        for id in settings.SEVERE_RISK_NUMBERS:
            if not Answer.objects.filter(id=id).exists():
                all_there = False
        self.assertTrue(all_there)

    def test_some_risk_numbers(self):
        all_there = True
        for id in settings.SOME_RISK_ANSWERS:
            if not Answer.objects.filter(id=id).exists():
                all_there = False
        self.assertTrue(all_there)
