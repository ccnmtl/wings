ssh pusher@dolph.ccnmtl.columbia.edu "/home/pusher/dump_wings.sh"
scp dolph.ccnmtl.columbia.edu:/tmp/wings.sql .
dropdb wings
createdb -O eddie  wings
psql eddie -d wings -f ./wings.sql
psql eddie -d wings -c "update pagetree_hierarchy set name = 'tiboudchou:12345';"
psql eddie -d wings -c "update main_stand set hostname = 'tiboudchou:12345' where title='wings';"
#scp -r dolph.ccnmtl.columbia.edu:/var/www/wings/uploads /var/www/wings/
