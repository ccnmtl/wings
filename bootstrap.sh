./bootstrap.py
CDIR=`pwd`
ADIR=`ls -d ve/lib/python*/site-packages/django/contrib/admin/`

#ADMIN TEMPLATES:
cd     $CDIR
    cd     $ADIR/templates/
    rm -rf admin
    ln -s  $CDIR/templates/admin/ admin
cd     $CDIR


#ADMIN CSS:
cd     $CDIR
    cd     $ADIR
    rm -rf media
    ln -s  $CDIR/media_admin_dir/ media
cd     $CDIR

