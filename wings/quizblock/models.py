from django.db import models
from pagetree.models import PageBlock
from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericRelation
from django import forms
from datetime import datetime
from django.core.urlresolvers import reverse
from django.conf import settings


class Quiz(models.Model):
    pageblocks = GenericRelation(PageBlock)
    description = models.TextField(blank=True)
    rhetorical = models.BooleanField(default=False)
    allow_redo = models.BooleanField(default=True)
    template_file = "quizblock/quizblock.html"

    display_name = "Quiz"
    exportable = True
    importable = True

    def pageblock(self):
        return self.pageblocks.all()[0]

    def __unicode__(self):
        return unicode(self.pageblock())

    def needs_submit(self):
        return not self.rhetorical

    def submit(self, user, data):
        """ a big open question here is whether we should
        be validating submitted answers here, on submission,
        or let them submit whatever garbage they want and only
        worry about it when we show the admins the results """
        s = Submission.objects.create(quiz=self, user=user)
        for k in data.keys():
            if k.startswith('question'):
                qid = int(k[len('question'):])
                question = Question.objects.get(id=qid)
                # it might make more sense to just accept a QueryDict
                # instead of a dict so we can use getlist()
                if isinstance(data[k], type([])):
                    for v in data[k]:
                        Response.objects.create(
                            submission=s,
                            question=question,
                            value=v)
                else:
                    Response.objects.create(
                        submission=s,
                        question=question,
                        value=data[k])

    def redirect_to_self_on_submit(self):
        return True

    def user_answered_all_questions(self, user):
        # TODO check for mandatory
        mandatory_questions = [
            q for q in self.question_set.all(
            ) if q.mandatory(
            )]
        for question in mandatory_questions:
            if question.is_unanswered_multiple_choice(user):
                return False
            if question.is_unanswered_text(user):
                return False
            if question.is_unanswered_single_choice(user):
                return False
        return True

    def unlocked(self, user):
        # meaning that the user can proceed *past* this one,
        # not that they can access this one. careful.
        # this is the default for forest.
        # return Submission.objects.filter(quiz=self,user=user).count() > 0

        # for wings, we want all questions with > 0 answers to be answered.
        return self.user_answered_all_questions(user)

    def edit_form(self):
        class EditForm(forms.Form):
            description = forms.CharField(widget=forms.widgets.Textarea(),
                                          initial=self.description)
            rhetorical = forms.BooleanField(initial=self.rhetorical)
            allow_redo = forms.BooleanField(initial=self.allow_redo)
            alt_text = "<a href=\"" + \
                reverse("edit-quiz", args=[self.id]) + \
                "\">manage questions/answers</a>"
        return EditForm()

    @classmethod
    def add_form(self):
        class AddForm(forms.Form):
            description = forms.CharField(widget=forms.widgets.Textarea())
            rhetorical = forms.BooleanField()
            allow_redo = forms.BooleanField()
        return AddForm()

    @classmethod
    def create(self, request):
        rhetorical = request.POST.get('rhetorical', '') != ''
        allow_redo = request.POST.get('allow_redo', '') != ''
        return Quiz.objects.create(
            description=request.POST.get('description', ''),
            rhetorical=rhetorical,
            allow_redo=allow_redo,
        )

    def edit(self, vals, files):
        self.description = vals.get('description', '')
        self.rhetorical = vals.get('rhetorical', False)
        self.allow_redo = vals.get('allow_redo', False)
        self.save()

    def add_question_form(self, request=None):
        return QuestionForm(request)

    def update_questions_order(self, question_ids):
        self.set_question_order(question_ids)

    def clear_user_submissions(self, user):
        Submission.objects.filter(user=user, quiz=self).delete()

    def as_dict(self):
        d = dict(description=self.description,
                 rhetorical=self.rhetorical,
                 allow_redo=self.allow_redo)
        d['questions'] = [q.as_dict() for q in self.question_set.all()]
        return d

    def import_from_dict(self, d):
        self.description = d['description']
        self.rhetorical = d['rhetorical']
        self.allow_redo = d.get('allow_redo', True)
        self.save()
        self.submission_set.all().delete()
        self.question_set.all().delete()
        for q in d['questions']:
            question = Question.objects.create(quiz=self, text=q['text'],
                                               question_type=q[
                                                   'question_type'],
                                               explanation=q['explanation'],
                                               intro_text=q['intro_text'])
            for a in q['answers']:
                Answer.objects.create(question=question,
                                      value=a['value'],
                                      label=a['label'],
                                      correct=a['correct'])


class Question(models.Model):
    quiz = models.ForeignKey(Quiz)
    text = models.TextField()
    question_type = models.CharField(
        max_length=256,
        choices=(
            ("multiple choice",
             "Multiple Choice: Multiple answers"),
            ("single choice",
             "Multiple Choice: Single answer"),
            ("single choice dropdown",
             "Multiple Choice: Single answer (dropdown)"),
            ("short text", "Short Text"),
            ("long text", "Long Text"),
        ))
    explanation = models.TextField(blank=True)
    intro_text = models.TextField(blank=True)

    class Meta:
        order_with_respect_to = 'quiz'

    def __unicode__(self):
        return self.text

    def display_number(self):
        return self._order

    def edit_form(self, request=None):
        return QuestionForm(request, instance=self)

    def add_answer_form(self, request=None):
        return AnswerForm(request)

    def correct_answer_values(self):
        return [a.value for a in self.answer_set.filter(correct=True)]

    def correct_answer_number(self):
        if self.question_type != "single choice":
            return None
        return self.answer_set.filter(correct=True)[0]._order

    def correct_answer_letter(self):
        if (self.question_type != "single choice" or
                self.answer_set.count() == 0):
            return None
        return chr(ord('A') + self.correct_answer_number())

    def update_answers_order(self, answer_ids):
        self.set_answer_order(answer_ids)

    def answerable(self):
        """ whether it makes sense to have Answers associated with this """
        return (
            self.question_type in [
                "multiple choice",
                "single choice",
                "single choice dropdown"]
        )

    def is_short_text(self):
        return self.question_type == "short text"

    def is_long_text(self):
        return self.question_type == "long text"

    def is_single_choice(self):
        return self.question_type == "single choice"

    def is_single_choice_dropdown(self):
        return self.question_type == "single choice dropdown"

    def is_multiple_choice(self):
        return self.question_type == "multiple choice"

    def user_responses(self, user):
        if len(Submission.objects.filter(user=user, quiz=self.quiz)) == 0:
            return []
        submission = Submission.objects.filter(
            user=user,
            quiz=self.quiz).order_by("-submitted")[0]
        return Response.objects.filter(question=self, submission=submission)

    def mandatory(self):
        return self.id not in settings.OPTIONAL_QUESTIONS

    def as_dict(self):
        return dict(
            text=self.text,
            question_type=self.question_type,
            explanation=self.explanation,
            intro_text=self.intro_text,
            answers=[a.as_dict() for a in self.answer_set.all()]
        )

    def is_unanswered_multiple_choice(self, user):
        return (self.is_multiple_choice() and
                len(self.user_responses(user)) == 0)

    def is_unanswered_single_choice(self, user):
        return (self.is_single_choice() and
                len(self.answer_set.all()) > 0 and
                len(self.user_responses(user)) == 0)

    def is_unanswered_text(self, user):
        if self.is_short_text() or self.is_long_text():
            if len(self.user_responses(user)) == 0:
                return True
            if len(self.user_responses(user)[0].value.strip()) == 0:
                return True
        return False


class Answer(models.Model):
    question = models.ForeignKey(Question)

    # this should be immutable once people start entering data.
    value = models.CharField(max_length=256, blank=True)

    # this can be edited at any time.
    numeric_value = models.IntegerField(null=True, blank=True)

    label = models.TextField(blank=True)

    # not used in Wings.
    correct = models.BooleanField(default=False)

    class Meta:
        order_with_respect_to = 'question'

    def __unicode__(self):
        return self.label

    def edit_form(self, request=None):
        return AnswerForm(request, instance=self)

    def as_dict(self):
        return dict(value=self.value, label=self.label, correct=self.correct)


class Submission(models.Model):
    quiz = models.ForeignKey(Quiz)
    user = models.ForeignKey(User)
    submitted = models.DateTimeField(default=datetime.now)

    def __unicode__(self):
        return (
            "quiz %d submission by %s at %s" % (
                self.quiz.id,
                unicode(self.user),
                self.submitted)
        )

    def contains_answer(self, answer):
        responses = Response.objects.filter(
            question=answer.question,
            submission=self)
        for r in responses:
            if r.corresponds_to_answer(answer):
                return True
        return False


class Response(models.Model):
    question = models.ForeignKey(Question)
    submission = models.ForeignKey(Submission)

    value = models.TextField(blank=True)

    class Meta:
        ordering = ('question',)

    def __unicode__(self):
        return (
            "response to %s [%s]" % (
                unicode(self.question),
                unicode(self.submission))
        )

    def is_correct(self):
        return self.value in self.question.correct_answer_values()

    def corresponds_to_answer(self, answer):
        """ This is a boolean"""
        # return answer.question == self.question and  answer.value ==
        # self.value
        return self.corresponding_answer() == answer

    def corresponding_answer(self):
        possible_answers = self.question.answer_set.all()

        for a in possible_answers:
            if a.value == self.value:
                return a

        return None


class QuestionForm(forms.ModelForm):

    class Meta:
        model = Question
        exclude = ("quiz",)
        fields = ('question_type', 'intro_text', 'text', 'explanation')


class AnswerForm(forms.ModelForm):

    class Meta:
        model = Answer
        exclude = ("question", "value",)
