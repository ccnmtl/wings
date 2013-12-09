# flake8: noqa
# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Deleting field 'RiskBlock.description'
        db.delete_column('riskblock_riskblock', 'description')

        # Adding field 'RiskBlock.no_risk_copy'
        db.add_column('riskblock_riskblock', 'no_risk_copy', self.gf('django.db.models.fields.TextField')(default='', blank=True), keep_default=False)

        # Adding field 'RiskBlock.some_risk_copy'
        db.add_column('riskblock_riskblock', 'some_risk_copy', self.gf('django.db.models.fields.TextField')(default='', blank=True), keep_default=False)

        # Adding field 'RiskBlock.severe_risk_copy'
        db.add_column('riskblock_riskblock', 'severe_risk_copy', self.gf('django.db.models.fields.TextField')(default='', blank=True), keep_default=False)


    def backwards(self, orm):
        
        # Adding field 'RiskBlock.description'
        db.add_column('riskblock_riskblock', 'description', self.gf('django.db.models.fields.TextField')(default='', blank=True), keep_default=False)

        # Deleting field 'RiskBlock.no_risk_copy'
        db.delete_column('riskblock_riskblock', 'no_risk_copy')

        # Deleting field 'RiskBlock.some_risk_copy'
        db.delete_column('riskblock_riskblock', 'some_risk_copy')

        # Deleting field 'RiskBlock.severe_risk_copy'
        db.delete_column('riskblock_riskblock', 'severe_risk_copy')


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
        'riskblock.riskblock': {
            'Meta': {'object_name': 'RiskBlock'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'no_risk_copy': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'severe_risk_copy': ('django.db.models.fields.TextField', [], {'blank': 'True'}),
            'some_risk_copy': ('django.db.models.fields.TextField', [], {'blank': 'True'})
        }
    }

    complete_apps = ['riskblock']
