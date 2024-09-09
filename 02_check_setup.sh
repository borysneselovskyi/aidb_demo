export con_id=`docker ps | awk '/aidb/ {print $1}'`
docker logs $con_id -f
