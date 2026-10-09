#!/bin/bash
docker network create demo_front
docker network create demo_back

docker run -d --name demo-db --network demo_back -e POSTGRES_USER=demo -e POSTGRES_PASSWORD=demo -e POSTGRES_DB=demo -v "$(pwd -W)/db:/docker-entrypoint-initdb.d" postgres:16-alpine

docker build -t demo-api:1.0 ./api
docker run -d --name demo-api --network demo_front -p 8080:3000 -e PGHOST=demo-db -e PGUSER=demo -e PGPASSWORD=demo -e PGDATABASE=demo demo-api:1.0
docker network connect demo_back demo-api

sleep 15

docker exec demo-api getent hosts demo-db
docker run --rm --network demo_front nicolaka/netshoot nc -zv demo-db 5432 || true
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAMConfig}} {{.IPAddress}}{{"\n"}}{{end}}' demo-db
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAMConfig}} {{.IPAddress}}{{"\n"}}{{end}}' demo-api
curl -s localhost:8080/products

docker rm -f demo-api demo-db
docker network rm demo_front demo_back