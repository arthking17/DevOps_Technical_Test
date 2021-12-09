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
docker run --name myapp_container --rm -it --privileged=true -v ${PWD}:/data myapp bash
echo ""

echo ""
echo "update repo in docker container"
echo "---------------------------------"
#docker exec -it myapp_container apt-get -y update
echo ""

echo ""
echo "install curl ansible in docker container"
echo "---------------------------------"
#docker exec -it myapp_container apt-get install --fix-missing -y curl ansible
echo ""

echo ""
echo "edit ansible hosts file in docker container"
echo "---------------------------------"
#docker exec -it myapp_container ip addr 
#docker exec -it myapp_container cat /etc/hosts 
#docker exec -it myapp_container cat /etc/ansible/hosts 
docker exec -it myapp_container echo -e '[local]\nlocalhost ansible_connection=local\n' > /etc/ansible/hosts
docker exec -it myapp_container echo "hllo+++++++++++++++++++++++++" 
docker exec -it myapp_container cat /etc/ansible/hosts 
docker exec -it myapp_container echo "hllo+++++++++++++++++++++++++"
echo ""

echo ""
echo "execute tomcat_test.sh in docker container"
echo "---------------------------------"
docker exec -it myapp_container /bin/bash data/tomcat_test.sh DEV
echo ""
