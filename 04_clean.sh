export con_id=`docker ps | awk '/aidb/ {print $1}'`

docker stop $con_id

docker rm $con_id

pkill Docker
