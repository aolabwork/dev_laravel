#!/bin/sh

docker system prune
docker container prune
docker rm -f `docker ps -a -q`
docker volume prune
rm -rf /var/lib/docker/containers/*
systemctl restart docker
docker ps -a
