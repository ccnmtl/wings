scp kang.ccnmtl.columbia.edu:/home/pusher/wings.sql .
dropdb wings
createdb -O eddie  wings
psql eddie -d wings -f ./wings.sql
psql eddie -d wings -c "update pagetree_hierarchy set name = 'tiur.ccnmtl.columbia.edu:12345';"
psql eddie -d wings -c "update main_stand set hostname = 'tiur.ccnmtl.columbia.edu:12345' where id= 8;"

