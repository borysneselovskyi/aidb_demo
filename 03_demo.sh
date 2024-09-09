export PGPASSWORD=edb

psql -h 0.0.0.0 -p 15432 -U postgres postgres -f demo.sql
