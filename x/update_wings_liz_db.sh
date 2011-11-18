ssh dolph.ccnmtl.columbia.edu "~/dump_wings.sh"
scp dolph.ccnmtl.columbia.edu:/tmp/wings.sql /home/pusher
dropdb wings_lizday
createdb -O pusher  wings_lizday
psql pusher -d wings_lizday -f /home/pusher/wings.sql
psql pusher -d wings_lizday -c "update pagetree_hierarchy set name = 'kang.ccnmtl.columbia.edu:11112';"
psql pusher -d wings_lizday -c "update main_stand set hostname = 'kang.ccnmtl.columbia.edu:11112' where id= 8;"
