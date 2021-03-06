from .models import Quiz, Question, Answer
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import get_object_or_404, render
from django.core.urlresolvers import reverse


def edit_quiz(request, id):
    quiz = get_object_or_404(Quiz, id=id)
    section = quiz.pageblock().section
    return render(request, 'quizblock/edit_quiz.html',
                  dict(quiz=quiz, section=section))


def delete_question(request, id):
    question = get_object_or_404(Question, id=id)
    if request.method == "POST":
        quiz = question.quiz
        question.delete()
        return HttpResponseRedirect(reverse("edit-quiz", args=[quiz.id]))
    return HttpResponse("""
<html><body><form action="." method="post">Are you Sure?
<input type="submit" value="Yes, delete it" /></form></body></html>
""")


def delete_answer(request, id):
    answer = get_object_or_404(Answer, id=id)
    if request.method == "POST":
        question = answer.question
        answer.delete()
        return (
            HttpResponseRedirect(reverse("edit-question", args=[question.id]))
        )
    return HttpResponse("""
<html><body><form action="." method="post">Are you Sure?
<input type="submit" value="Yes, delete it" /></form></body></html>
""")


def reorder_answers(request, id):
    if request.method != "POST":
        return HttpResponse("only use POST for this")
    question = get_object_or_404(Question, id=id)
    keys = sorted(request.GET.keys())
    answers = [int(request.GET[k]) for k in keys if k.startswith('answer_')]
    question.update_answers_order(answers)
    return HttpResponse("ok")


def reorder_questions(request, id):
    if request.method != "POST":
        return HttpResponse("only use POST for this", status=400)
    quiz = get_object_or_404(Quiz, id=id)
    keys = request.GET.keys()
    question_keys = sorted([int(k[len('question_'):])
                           for k in keys if k.startswith('question_')])
    questions = [int(request.GET['question_' + str(k)]) for k in question_keys]
    quiz.update_questions_order(questions)
    return HttpResponse("ok")


def add_question_to_quiz(request, id):
    quiz = get_object_or_404(Quiz, id=id)
    form = quiz.add_question_form(request.POST)
    if form.is_valid():
        question = form.save(commit=False)
        question.quiz = quiz
        question.save()
    return HttpResponseRedirect(reverse("edit-quiz", args=[quiz.id]))


def edit_question(request, id):
    question = get_object_or_404(Question, id=id)
    if request.method == "POST":
        form = question.edit_form(request.POST)
        question = form.save(commit=False)
        question.save()
        return (
            HttpResponseRedirect(reverse("edit-question", args=[question.id]))
        )
    return render(request, 'quizblock/edit_question.html',
                  dict(question=question))


def add_answer_to_question(request, id):
    question = get_object_or_404(Question, id=id)
    form = question.add_answer_form(request.POST)
    if form.is_valid():
        answer = form.save(commit=False)
        answer.question = question
        if answer.label == '':
            answer.label = answer.value
        answer.save()
    return HttpResponseRedirect(reverse("edit-question", args=[question.id]))


def edit_answer(request, id):
    answer = get_object_or_404(Answer, id=id)
    if request.method == "POST":
        form = answer.edit_form(request.POST)
        answer = form.save(commit=False)
        answer.save()
        return HttpResponseRedirect(reverse("edit-answer", args=[answer.id]))
    return render(request, 'quizblock/edit_answer.html', dict(answer=answer))
