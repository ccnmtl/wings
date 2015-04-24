from django.db import models
from pagetree.models import PageBlock
from django.contrib.contenttypes import generic
from django import forms
from django.conf import settings
from wings.quizblock.models import Answer, Submission, Response


def list_answers(answers):
    for answer in Answer.objects.filter(id__in=answers):
        print "   (%d) %s:(%d) %s " % (
            answer.question.id, answer.question.text, answer.id, answer.label)


def document():
    for label, answers in [('severe', settings.SEVERE_RISK_NUMBERS),
                           ('some', settings.SOME_RISK_ANSWERS)]:
        print ''
        print ''
        print ''
        print label
        list_answers(answers)


def user_chose_any_of(user, answers):
    for answer in Answer.objects.filter(id__in=answers):
        if answer.question.is_single_choice():
            que = answer.question
            quiz = que.quiz
            sub = Submission.objects.filter(
                quiz=quiz,
                user=user).order_by("-submitted")
            if sub.count() > 0:  # user answered this question.
                res = Response.objects.filter(question=que, submission=sub[0])
                if res.count() > 0:
                    if res[0].value == answer.value:
                        return True
    return False


def risk_score(user):
    """Here is the score recipe. It is not a matter of adding up
    answers to reach a threshold, rather it is a list of
    indicators. Any high risk indicator trumps a 'some' risk
    indicator. You only need one indicator to fall into a some or high
    risk category. The indicators are as follows:

    No risk: none of the above indicators"""
    if user_chose_any_of(user, settings.SEVERE_RISK_NUMBERS):
        return 'severe_risk'
    if user_chose_any_of(user, settings.SOME_RISK_ANSWERS):
        return 'some_risk'
    return 'no_risk'


def risk_copy(block, user):
    tmp = risk_score(user)
    if tmp == 'no_risk':
        return block.no_risk_copy
    elif tmp == 'some_risk':
        return block.some_risk_copy
    elif tmp == 'severe_risk':
        return block.severe_risk_copy


class RiskBlock(models.Model):
    pageblocks = generic.GenericRelation(PageBlock)
    no_risk_copy = models.TextField(blank=True)
    some_risk_copy = models.TextField(blank=True)
    severe_risk_copy = models.TextField(blank=True)
    template_file = "riskblock/riskblock.html"
    js_template_file = "riskblock/riskblock_js.html"
    css_template_file = "riskblock/riskblock_css.html"

    display_name = "Risk Block"

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def edit_form(self):
        class EditForm(forms.Form):
            no_risk_copy = forms.CharField(
                initial=self.no_risk_copy,
                widget=forms.widgets.Textarea())
            some_risk_copy = forms.CharField(
                initial=self.some_risk_copy,
                widget=forms.widgets.Textarea())
            severe_risk_copy = forms.CharField(
                initial=self.severe_risk_copy,
                widget=forms.widgets.Textarea())
        return EditForm()

    def edit(self, vals, files=None):
        self.no_risk_copy = vals.get('no_risk_copy', '')
        self.some_risk_copy = vals.get('some_risk_copy', '')
        self.severe_risk_copy = vals.get('severe_risk_copy', '')
        self.save()

    def dir(self):
        return dir(self)

    @classmethod
    def add_form(self):
        class AddForm(forms.Form):
            no_risk_copy = forms.CharField(widget=forms.widgets.Textarea())
            some_risk_copy = forms.CharField(widget=forms.widgets.Textarea())
            severe_risk_copy = forms.CharField(widget=forms.widgets.Textarea())
        return AddForm()

    @classmethod
    def create(self, request):
        return RiskBlock.objects.create(
            no_risk_copy=request.POST.get('no_risk_copy', ''),
            some_risk_copy=request.POST.get('some_risk_copy', ''),
            severe_risk_copy=request.POST.get('severe_risk_copy', ''),
        )

    def submit(self, user, data):
        pass

    def redirect_to_self_on_submit(self):
        return True

    def unlocked(self, user):
        return True
