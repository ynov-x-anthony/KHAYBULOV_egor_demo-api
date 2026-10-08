#!/bin/bash
# volumes_egor_khaybulov.sh

docker rm -f demo-api-container demo-db 2>/dev/null || true
docker network rm demo_net 2>/dev/null || true

docker network create demo_net

docker build -t demo-api:1.0 ./api

docker volume create demo_pgdata

INIT_SQL_PATH=$(pwd)/db/init.sql

docker run -d --name demo-db \
  --network demo_net \
  -v demo_pgdata:/var/lib/postgresql/data \
  -v "${INIT_SQL_PATH}":/docker-entrypoint-initdb.d/init.sql:ro \
  -e POSTGRES_USER=demo \
  -e POSTGRES_PASSWORD=demo \
  -e POSTGRES_DB=demo \
  postgres:16-alpine

until docker exec demo-db pg_isready -U demo >/dev/null 2>&1; do
  echo -n "."
  sleep 1
done
docker run -d --name demo-api-container \
  -p 8080:3000 \
  --network demo_net \
  -e PGHOST=demo-db \
  -e PGUSER=demo \
  -e PGPASSWORD=demo \
  -e PGDATABASE=demo \
  demo-api:1.0

sleep 5

curl -s -X POST -H 'content-type: application/json' \
  -d '{"name":"Casquette Démo","price_cents":1200}' localhost:8080/products
echo -e "\n"

docker rm -f demo-db

docker run -d --name demo-db \
  --network demo_net \
  -v demo_pgdata:/var/lib/postgresql/data \
  -v "${INIT_SQL_PATH}":/docker-entrypoint-initdb.d/init.sql:ro \
  -e POSTGRES_USER=demo \
  -e POSTGRES_PASSWORD=demo \
  -e POSTGRES_DB=demo \
  postgres:16-alpine

until docker exec demo-db pg_isready -U demo >/dev/null 2>&1; do
  echo -n "."
  sleep 1
done

docker restart demo-api-container >/dev/null
sleep 5


docker volume ls | grep demo_pgdata

curl -s localhost:8080/products
echo -e "\n"

echo "Nettoyage"
docker rm -f demo-api-container demo-db >/dev/null
docker network rm demo_net >/dev/null
# docker volume rm demo_pgdata
