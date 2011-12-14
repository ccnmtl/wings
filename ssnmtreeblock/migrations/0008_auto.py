# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Removing M2M table for field support_types on 'SsnmTreeBlock'
        db.delete_table('ssnmtreeblock_ssnmtreeblock_support_types')

        # Adding M2M table for field editable_support_types on 'SsnmTreeBlock'
        db.create_table('ssnmtreeblock_ssnmtreeblock_editable_support_types', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('ssnmtreeblock', models.ForeignKey(orm['ssnmtreeblock.ssnmtreeblock'], null=False)),
            ('ssnmtreesupporttype', models.ForeignKey(orm['ssnmtreeblock.ssnmtreesupporttype'], null=False))
        ))
        db.create_unique('ssnmtreeblock_ssnmtreeblock_editable_support_types', ['ssnmtreeblock_id', 'ssnmtreesupporttype_id'])

        # Adding M2M table for field visible_support_types on 'SsnmTreeBlock'
        db.create_table('ssnmtreeblock_ssnmtreeblock_visible_support_types', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('ssnmtreeblock', models.ForeignKey(orm['ssnmtreeblock.ssnmtreeblock'], null=False)),
            ('ssnmtreesupporttype', models.ForeignKey(orm['ssnmtreeblock.ssnmtreesupporttype'], null=False))
        ))
        db.create_unique('ssnmtreeblock_ssnmtreeblock_visible_support_types', ['ssnmtreeblock_id', 'ssnmtreesupporttype_id'])


    def backwards(self, orm):
        
        # Adding M2M table for field support_types on 'SsnmTreeBlock'
        db.create_table('ssnmtreeblock_ssnmtreeblock_support_types', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('ssnmtreeblock', models.ForeignKey(orm['ssnmtreeblock.ssnmtreeblock'], null=False)),
            ('ssnmtreesupporttype', models.ForeignKey(orm['ssnmtreeblock.ssnmtreesupporttype'], null=False))
        ))
        db.create_unique('ssnmtreeblock_ssnmtreeblock_support_types', ['ssnmtreeblock_id', 'ssnmtreesupporttype_id'])

        # Removing M2M table for field editable_support_types on 'SsnmTreeBlock'
        db.delete_table('ssnmtreeblock_ssnmtreeblock_editable_support_types')

        # Removing M2M table for field visible_support_types on 'SsnmTreeBlock'
        db.delete_table('ssnmtreeblock_ssnmtreeblock_visible_support_types')


    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'pagetree.hierarchy': {
            'Meta': {'object_name': 'Hierarchy'},
            'base_url': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '256'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'})
        },
        'pagetree.pageblock': {
            'Meta': {'ordering': "('section', 'ordinality')", 'object_name': 'PageBlock'},
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '256', 'null': 'True', 'blank': 'True'}),
            'object_id': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'ordinality': ('django.db.models.fields.PositiveIntegerField', [], {'default': '1'}),
            'section': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['pagetree.Section']"})
        },
        'pagetree.section': {
            'Meta': {'object_name': 'Section'},
            'depth': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'hierarchy': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['pagetree.Hierarchy']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'numchild': ('django.db.models.fields.PositiveIntegerField', [], {'default': '0'}),
            'path': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '255'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '50', 'db_index': 'True'})
        },
        'ssnmtreeblock.ssnmtreeblock': {
            'Meta': {'object_name': 'SsnmTreeBlock'},
            'boxes': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['ssnmtreeblock.SsnmTreeBox']", 'symmetrical': 'False'}),
            'editable_support_types': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'blocks_where_you_can_edit_this_support_type'", 'null': 'True', 'symmetrical': 'False', 'to': "orm['ssnmtreeblock.SsnmTreeSupportType']"}),
            'error_copy': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'page_type': ('django.db.models.fields.TextField', [], {'default': "'page_1'"}),
            'visible_support_types': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'blocks_where_you_can_see_this_support_type'", 'null': 'True', 'symmetrical': 'False', 'to': "orm['ssnmtreeblock.SsnmTreeSupportType']"})
        },
        'ssnmtreeblock.ssnmtreebox': {
            'Meta': {'object_name': 'SsnmTreeBox'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.TextField', [], {'unique': 'True', 'null': 'True', 'blank': 'True'}),
            'pixels_from_left': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'pixels_from_top': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        },
        'ssnmtreeblock.ssnmtreeperson': {
            'Meta': {'object_name': 'SsnmTreePerson'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.TextField', [], {'default': "''", 'null': 'True', 'blank': 'True'}),
            'support_types': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['ssnmtreeblock.SsnmTreeSupportType']", 'symmetrical': 'False'}),
            'tree_box': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['ssnmtreeblock.SsnmTreeBox']"}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"})
        },
        'ssnmtreeblock.ssnmtreesupporttype': {
            'Meta': {'object_name': 'SsnmTreeSupportType'},
            'description': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'label': ('django.db.models.fields.TextField', [], {'unique': 'True', 'null': 'True', 'blank': 'True'})
        }
    }

    complete_apps = ['ssnmtreeblock']
