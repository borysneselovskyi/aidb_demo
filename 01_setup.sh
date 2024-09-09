open -a Docker

i=15

while [ $i -gt 0 ]
do
   echo Docker will be started in $i...
   i=`expr ${i} - 5`
   sleep 5
   #i=$b
done

export EDB_REPO_TOKEN="<add your EDB Repo Token>"
export OPENAI_API_KEY="<add your OPENAI API Key>"
export PGPASSWORD="edb"

docker login docker.enterprisedb.com -u tech-preview -p $EDB_REPO_TOKEN
docker pull docker.enterprisedb.com/tech-preview/aidb

docker run -d --name pgai \
       -e OPENAI_API_KEY=${OPENAI_API_KEY} \
       -e POSTGRES_PASSWORD=${PGPASSWORD} \
       -e PGDATA=/var/lib/postgresql/data/pgdata \
       -p 15432:5432 \
       docker.enterprisedb.com/tech-preview/aidb:latest
