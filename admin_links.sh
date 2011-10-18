#TODO make this more flexible, capable to deal with 2.6 e.g.

#TODO actually use settings.py to override these.

#TODO use variables for these endless pathnames

mv ./ve/lib/python2.7/site-packages/django/contrib/admin/templates/admin ./ve/lib/python2.7/site-packages/django/contrib/admin/templates/admin_overridden 
pushd ve/lib/python2.7/site-packages/django/contrib/admin/templates
ln -s ../../../../../../../../templates/admin/ .
popd

mv    ve/lib/python2.7/site-packages/django/contrib/admin/media/ ve/lib/python2.7/site-packages/django/contrib/admin/media_overridden
pushd ve/lib/python2.7/site-packages/django/contrib/admin
ln -s ../../../../../../../media_admin_dir/ media
popd


mv ve/lib/python2.7/site-packages/django/contrib/admin/
