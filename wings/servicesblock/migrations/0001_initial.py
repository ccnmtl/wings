# flake8: noqa
# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('quizblock', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='NarrowedDownAnswer',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('answer', models.ForeignKey(to='quizblock.Answer', null=True)),
                ('question', models.ForeignKey(default=None, to='quizblock.Question')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'Services: Narrowed Down Answer',
                'verbose_name_plural': 'Services: Narrowed Down Answers',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ServiceProvider',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.TextField(null=True, blank=True)),
                ('phone', models.TextField(null=True, blank=True)),
                ('url', models.TextField(null=True, blank=True)),
                ('address', models.TextField(null=True, blank=True)),
                ('description', models.TextField(help_text=b'One-sentence description of the service', null=True, blank=True)),
                ('map_image', models.ImageField(null=True, upload_to=b'images/', blank=True)),
                ('issue', models.ForeignKey(to='quizblock.Answer', null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ServicesBlock',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('description', models.TextField(blank=True)),
                ('page_type', models.TextField(default=b'page_1', choices=[('page_1', 'Drill down 1'), ('page_2', 'Drill down 2')])),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
