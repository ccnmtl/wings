# flake8: noqa
# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ('pagetree', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ActionTaken',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('when', models.DateTimeField(auto_now_add=True, verbose_name=b'When?')),
            ],
            options={
                'ordering': ['user', '-when'],
                'verbose_name_plural': 'Actions taken',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='ActionType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('label', models.CharField(max_length=64, null=True, blank=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='actiontaken',
            name='action',
            field=models.ForeignKey(help_text=b'Description of the action logged. First word should be a verb in the past tense, third person.', to='analytics.ActionType'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='actiontaken',
            name='section',
            field=models.ForeignKey(blank=True, to='pagetree.Section', help_text=b'On what page?', null=True, verbose_name=b'Where?'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='actiontaken',
            name='user',
            field=models.ForeignKey(help_text=b'User who took the action', to=settings.AUTH_USER_MODEL),
            preserve_default=True,
        ),
    ]
