ssh dolph.ccnmtl.columbia.edu "~/dump_wings.sh"
scp dolph.ccnmtl.columbia.edu:/tmp/wings.sql /home/pusher
dropdb wings_common
createdb -O pusher  wings_common
psql pusher -d wings_common -f /home/pusher/wings.sql
psql pusher -d wings_common -c "update pagetree_hierarchy set name = 'kang.ccnmtl.columbia.edu:54321';"
psql pusher -d wings_common -c "update main_stand set hostname = 'kang.ccnmtl.columbia.edu:54321' where id= 8;"
