# flake8: noqa
# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='SsnmTreeBlock',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('error_copy', models.TextField(null=True, blank=True)),
                ('page_type', models.TextField(default=b'page_1', choices=[('page_1', 'Choose names'), ('page_2', 'Emotional support'), ('page_3', 'Practical support'), ('page_e', 'Error page')])),
            ],
            options={
                'verbose_name': 'SSNM Tree Block',
                'verbose_name_plural': 'SSNM Tree Blocks',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SsnmTreeBox',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('label', models.TextField(unique=True, null=True, blank=True)),
                ('pixels_from_left', models.IntegerField(default=0)),
                ('pixels_from_top', models.IntegerField(default=0)),
            ],
            options={
                'verbose_name': 'SSNM Tree: Text Box',
                'verbose_name_plural': 'SSNM Tree: Text Boxes',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SsnmTreePerson',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.TextField(default=b'', null=True, blank=True)),
            ],
            options={
                'verbose_name': 'SSNM Tree: People',
                'verbose_name_plural': 'SSNM Tree: Person',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='SsnmTreeSupportType',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('label', models.TextField(unique=True, null=True, blank=True)),
                ('description', models.TextField(null=True, blank=True)),
            ],
            options={
                'verbose_name_plural': 'SSNM Tree: Types of Support',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='ssnmtreeperson',
            name='support_types',
            field=models.ManyToManyField(to='ssnmtreeblock.SsnmTreeSupportType'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ssnmtreeperson',
            name='tree_box',
            field=models.ForeignKey(to='ssnmtreeblock.SsnmTreeBox'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ssnmtreeperson',
            name='user',
            field=models.ForeignKey(to=settings.AUTH_USER_MODEL),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ssnmtreeblock',
            name='boxes',
            field=models.ManyToManyField(to='ssnmtreeblock.SsnmTreeBox'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ssnmtreeblock',
            name='editable_support_types',
            field=models.ManyToManyField(help_text=b'Support Types you can *edit* on this page.', related_name='blocks_where_you_can_edit_this_support_type', null=True, to='ssnmtreeblock.SsnmTreeSupportType', blank=True),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='ssnmtreeblock',
            name='visible_support_types',
            field=models.ManyToManyField(help_text=b'Support Types you can *see* on this page.', related_name='blocks_where_you_can_see_this_support_type', null=True, to='ssnmtreeblock.SsnmTreeSupportType', blank=True),
            preserve_default=True,
        ),
    ]
