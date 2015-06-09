## Docker

Run the database container

```
docker create --name qtr_data -v /data busybox
docker run -d -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -e PGDATA=/data --volumes-from=qtr_data --name pg postgres
```

Connect to the pg container and import the data (if needed)

```
docker exec -ti qtr /bin/bash
psql --username=postgres --command="SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = 'qtrplan' AND pid <> pg_backend_pid();"
psql --username=postgres --command="DROP DATABASE qtrplan;"
psql --username=postgres --command="CREATE DATABASE qtrplan WITH OWNER postgres ENCODING 'UTF8';"
cat /tmp/qtr.sql | psql --username=postgres qtrplan

```

Create a `.env.docker` file with the contents:

```
DB_NAME=qtrplan
DB_HOST=pg
DB_USERNAME=postgres
DB_PASSWORD=password

RAILS_SERVE_STATIC_FILES=true

SECRET_KEY_BASE=foobarbazsomething
```

Build and run the image:

```
docker build --force-rm=true -t qtr .
docker run -d -p 3000:3000 --link pg:pg --name qtr --env-file=.env.docker qtr
# docker rmi qtr
docker exec -ti qtr rake db:create
docker exec -ti qtr rake db:migrate
```
