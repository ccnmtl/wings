from django.test import TestCase
from wings.quizblock.models import Quiz, Question, Answer, Submission
from wings.quizblock.models import Response
from wings.analytics.tests.factories import UserFactory


class FakeReq(object):
    def __init__(self):
        self.POST = dict()


class TestBasics(TestCase):
    def test_create(self):
        q = Quiz()
        self.assertNotEqual(q, None)

    def test_needs_submit(self):
        q = Quiz()
        self.assertTrue(q.needs_submit())
        q.rhetorical = True
        self.assertFalse(q.needs_submit())

    def test_add_form(self):
        f = Quiz.add_form()
        self.assertTrue('rhetorical' in f.fields)
        self.assertTrue('allow_redo' in f.fields)

    def test_create_method(self):
        r = FakeReq()
        q = Quiz.create(r)
        self.assertEquals(q.description, '')
        self.assertEquals(q.display_name, 'Quiz')
        self.assertFalse(q.rhetorical)
        self.assertFalse(q.allow_redo)

    def test_create_method_two(self):
        r = FakeReq()
        r.POST['rhetorical'] = 'on'
        r.POST['allow_redo'] = 'on'
        q = Quiz.create(r)
        self.assertEquals(q.description, '')
        self.assertEquals(q.display_name, 'Quiz')
        self.assertTrue(q.rhetorical)
        self.assertTrue(q.allow_redo)

    def test_dict_roundtrip(self):
        q1 = Quiz(description="first")
        d = q1.as_dict()
        q2 = Quiz(description="second")
        q2.import_from_dict(d)
        self.assertEquals(q2.description, "first")
        self.assertEquals(q1.allow_redo, q2.allow_redo)
        self.assertEquals(q1.rhetorical, q2.rhetorical)

    def test_edit(self):
        q = Quiz()
        q.edit(dict(description='foo', rhetorical='1',
                    allow_redo='0'), None)
        self.assertEqual(q.description, 'foo')
        self.assertEqual(q.rhetorical, '1')
        self.assertEqual(q.allow_redo, '0')

    def test_edit_two(self):
        q = Quiz()
        q.edit(dict(description='foo'), None)
        self.assertEqual(q.description, 'foo')
        self.assertFalse(q.rhetorical)
        self.assertFalse(q.allow_redo)

    def test_edit_form(self):
        # can't figure out how to test this one since it depends on
        # urls being set up

        # q = Quiz()
        # f = q.edit_form()
        # self.assertTrue('description' in f.fields)
        pass

    def test_redirect_to_self_on_submit(self):
        q = Quiz()
        self.assertTrue(q.redirect_to_self_on_submit())

    def test_add_question_form(self):
        q = Quiz()
        f = q.add_question_form(None)
        self.assertTrue('text' in f.fields)


class UserTests(TestCase):
    def setUp(self):
        self.u = UserFactory(username="testuser")

    def test_submit(self):
        quiz = Quiz.objects.create()

        # no questions - automatically unlocked
        self.assertTrue(quiz.unlocked(self.u))

        # no mandatory questions - automatically unlocked
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        with self.settings(OPTIONAL_QUESTIONS=[question.id]):
            self.assertTrue(quiz.unlocked(self.u))

        # one mandatory question - no responses - locked
        self.assertFalse(quiz.unlocked(self.u))

        # one mandatory question, one response
        key = 'question%s' % question.id
        quiz.submit(self.u, {key: 'bar'})
        self.assertTrue(quiz.unlocked(self.u))

        quiz.clear_user_submissions(self.u)
        self.assertFalse(quiz.unlocked(self.u))


class QuestionTest(TestCase):
    def test_unicode(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        self.assertEqual(str(question), "foo")

    def test_display_number(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        self.assertEqual(question.display_number(), 0)

    def test_edit_form(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        f = question.edit_form()
        self.assertTrue('question_type' in f.fields)

    def test_add_answer_form(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        f = question.add_answer_form()
        self.assertTrue(hasattr(f, 'fields'))

    def test_correct_answer_values(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        self.assertEqual(question.correct_answer_values(), [])

    def test_correct_answer_number_wrong_type(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        self.assertEqual(question.correct_answer_number(), None)

    def test_correct_answer_number(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice")
        Answer.objects.create(question=question, value='1', label='one',
                              correct=True)
        self.assertEqual(question.correct_answer_number(), 0)

    def test_correct_answer_letter_wrong_type(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        self.assertEqual(question.correct_answer_letter(), None)

    def test_correct_answer_letter(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice")
        Answer.objects.create(question=question, value='1', label='one',
                              correct=True)
        self.assertEqual(question.correct_answer_letter(), 'A')

    def test_update_answers_order(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        question.update_answers_order([])

    def test_answerable(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        self.assertFalse(question.answerable())
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice")
        self.assertTrue(question.answerable())

    def test_types(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        self.assertFalse(question.is_short_text())
        self.assertTrue(question.is_long_text())
        self.assertFalse(question.is_single_choice())
        self.assertFalse(question.is_single_choice_dropdown())
        self.assertFalse(question.is_multiple_choice())

    def test_as_dict(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="long text")
        d = question.as_dict()
        self.assertEqual(d['text'], "foo")
        self.assertEqual(d['question_type'], "long text")

    def test_user_responses(self):
        user = UserFactory(username="testuser")
        quiz = Quiz.objects.create()
        q1 = Question.objects.create(quiz=quiz, text="question_one",
                                     question_type="single choice")
        Answer.objects.create(question=q1, label="a", value="a", correct=True)
        Answer.objects.create(question=q1, label="b", value="b")

        self.assertEquals(len(q1.user_responses(user)), 0)

        s = Submission.objects.create(quiz=quiz, user=user)
        self.assertEquals(len(q1.user_responses(user)), 0)

        Response.objects.create(question=q1, submission=s, value="a")
        self.assertEquals(len(q1.user_responses(user)), 1)


class TestIsUserCorrect(TestCase):

    def setUp(self):
        self.user = UserFactory(username="testuser")
        self.quiz = Quiz.objects.create()

    def test_short_text(self):
        question = Question.objects.create(quiz=self.quiz,
                                           text="question_one",
                                           question_type="short text")

        # no submissions
        sub = Submission.objects.create(quiz=self.quiz, user=self.user)
        Response.objects.create(question=question, submission=sub, value="a")

    def test_long_text(self):
        question = Question.objects.create(quiz=self.quiz,
                                           text="question_one",
                                           question_type="long text")

        # no submissions
        sub = Submission.objects.create(quiz=self.quiz, user=self.user)
        Response.objects.create(question=question, submission=sub, value="b")

    def test_single_choice_no_correct_answers(self):
        question = Question.objects.create(quiz=self.quiz,
                                           text="question_one",
                                           question_type="single choice")
        Answer.objects.create(question=question, label="a", value="a")
        Answer.objects.create(question=question, label="b", value="b")
        Answer.objects.create(question=question, label="c", value="c")

        # user responded
        sub = Submission.objects.create(quiz=self.quiz, user=self.user)
        Response.objects.create(question=question, submission=sub, value="b")

    def test_single_choice_correct_answers(self):
        question = Question.objects.create(quiz=self.quiz,
                                           text="question_one",
                                           question_type="single choice")
        Answer.objects.create(question=question, label="a", value="a",
                              correct=True)
        Answer.objects.create(question=question, label="b", value="b")
        Answer.objects.create(question=question, label="c", value="c")

        # user responded
        sub = Submission.objects.create(quiz=self.quiz, user=self.user)
        response = Response.objects.create(question=question,
                                           submission=sub, value="a")

        response.value = 'b'
        response.save()

    def test_multiple_choice_correct_answers(self):
        question = Question.objects.create(quiz=self.quiz,
                                           text="question_one",
                                           question_type="multiple choice")
        Answer.objects.create(question=question, label="a", value="a",
                              correct=True)
        Answer.objects.create(question=question, label="b", value="b",
                              correct=True)
        Answer.objects.create(question=question, label="c", value="c")

        # user responded - incorrectly
        sub = Submission.objects.create(quiz=self.quiz, user=self.user)
        c = Response.objects.create(question=question,
                                    submission=sub, value="c")

        # user responded - partially incorrectly
        Response.objects.create(question=question, submission=sub, value="a")

        # user responded - partially incorrectly
        Response.objects.create(question=question, submission=sub, value="b")

        # kill the incorrect one
        c.delete()


class AnswerTest(TestCase):
    def test_unicode(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice")
        answer = Answer.objects.create(question=question, label="an answer")
        self.assertEqual(str(answer), "an answer")

    def test_edit_form(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice")
        answer = Answer.objects.create(question=question, label="an answer")
        f = answer.edit_form()
        self.assertTrue('label' in f.fields)

    def test_as_dict(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice")
        answer = Answer.objects.create(question=question,
                                       label="an answer")
        d = answer.as_dict()
        self.assertEqual(d['label'], 'an answer')
        self.assertFalse(d['correct'])

    def test_quiz_round_trip(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice",
        )
        Answer.objects.create(question=question, label="an answer")
        Answer.objects.create(
            question=question, label="another answer")

        d = quiz.as_dict()
        quiz2 = Quiz.objects.create()
        quiz2.import_from_dict(d)
        self.assertEqual(quiz2.question_set.count(), 1)


class SubmissionTest(TestCase):
    def test_unicode(self):
        quiz = Quiz.objects.create()
        user = UserFactory(username="testuser")
        s = Submission.objects.create(quiz=quiz, user=user)
        self.assertTrue(
            str(s).startswith("quiz %d submission by testuser" % quiz.id))


class ResponseTest(TestCase):
    def test_unicode(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice")
        Answer.objects.create(question=question, label="an answer")
        user = UserFactory(username="testuser")
        s = Submission.objects.create(quiz=quiz, user=user)
        response = Response.objects.create(
            question=question, submission=s, value="an answer")
        self.assertTrue(str(response).startswith("response to "))

    def test_is_correct(self):
        quiz = Quiz.objects.create()
        question = Question.objects.create(
            quiz=quiz, text="foo", question_type="single choice")
        Answer.objects.create(question=question, label="an answer")
        user = UserFactory(username="testuser")
        s = Submission.objects.create(quiz=quiz, user=user)
        response = Response.objects.create(
            question=question, submission=s, value="an answer")
        self.assertFalse(response.is_correct())
