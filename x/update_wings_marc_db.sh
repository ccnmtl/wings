ssh pusher@dolph.ccnmtl.columbia.edu "/home/pusher/dump_wings.sh"
scp dolph.ccnmtl.columbia.edu:/tmp/wings.sql .
dropdb wings_marc -U pusher
createdb -U pusher -O pusher  wings_marc
psql pusher -d wings_marc -f ./wings.sql
psql pusher -d wings_marc -c "update pagetree_hierarchy set name = 'kang.ccnmtl.columbia.edu:13094';"
psql pusher -d wings_marc -c "update main_stand set hostname = 'kang.ccnmtl.columbia.edu:13094' where title='wings_marc';"
scp -r dolph.ccnmtl.columbia.edu:/var/www/wings/uploads/audio_file /var/www/wings/uploads
scp -r dolph.ccnmtl.columbia.edu:/var/www/wings/uploads/images     /var/www/wings/uploads

