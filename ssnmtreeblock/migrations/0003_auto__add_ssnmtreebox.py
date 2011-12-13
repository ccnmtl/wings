# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'SsnmTreeBox'
        db.create_table('ssnmtreeblock_ssnmtreebox', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('pixels_from_top', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('pixels_from_left', self.gf('django.db.models.fields.IntegerField')(default=0)),
        ))
        db.send_create_signal('ssnmtreeblock', ['SsnmTreeBox'])

        # Adding M2M table for field boxes on 'SsnmTreeBlock'
        db.create_table('ssnmtreeblock_ssnmtreeblock_boxes', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('ssnmtreeblock', models.ForeignKey(orm['ssnmtreeblock.ssnmtreeblock'], null=False)),
            ('ssnmtreebox', models.ForeignKey(orm['ssnmtreeblock.ssnmtreebox'], null=False))
        ))
        db.create_unique('ssnmtreeblock_ssnmtreeblock_boxes', ['ssnmtreeblock_id', 'ssnmtreebox_id'])


    def backwards(self, orm):
        
        # Deleting model 'SsnmTreeBox'
        db.delete_table('ssnmtreeblock_ssnmtreebox')

        # Removing M2M table for field boxes on 'SsnmTreeBlock'
        db.delete_table('ssnmtreeblock_ssnmtreeblock_boxes')


    models = {
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
            'error_copy': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'page_type': ('django.db.models.fields.TextField', [], {'default': "'page_1'"})
        },
        'ssnmtreeblock.ssnmtreebox': {
            'Meta': {'object_name': 'SsnmTreeBox'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'pixels_from_left': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'pixels_from_top': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        }
    }

    complete_apps = ['ssnmtreeblock']
