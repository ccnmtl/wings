if [ ! -e "$1" ]
then
  echo "No file named $1."
  exit 1
fi
read -p "Drop pass_eddie and replace with the contents of $1 (y/n)? "
if [ $REPLY != "y" ]; then
    echo "Kthxbye"
    exit 0
fi
dropdb wings
createdb -O pusher wings
psql -Upusher -d wings -f $1
