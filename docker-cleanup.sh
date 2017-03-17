#!/bin/bash
docker rmi $(docker images -a -q)
service docker stop
sleep 10
ls -ltr /opt/docker 

rm -rf /opt/docker/*

ls -ltr /opt/docker

mkdir /opt/docker/tmp

chmod 777 /opt/docker/tmp

service docker start

docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
