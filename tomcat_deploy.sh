#!/bin/bash
#
# test ansible configuration in docker container

echo ""
echo "build docker image"
echo "---------------------------------"
docker build -t myapp .
echo ""

echo ""
echo "launch container"
echo "---------------------------------"
docker run --name myapp_container --rm -dt --privileged=true -v ${PWD}:/data myapp bash
echo ""

echo ""
echo "execute tomcat_test.sh in docker container"
echo "---------------------------------"
docker exec -it myapp_container /bin/bash data/tomcat_test.sh DEV
echo ""
