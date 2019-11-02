#!/bin/bash

if [ -f docker_images ]; then
echo Creating Simple Logs
touch docker_images
else
rm docker_images
touch docker_images
fi

echo BUILDING DOCKER IMAGES FILES
echo ----------------------------
sudo docker build -t web-galeri .
echo Docker Images ID >> docker_images
sudo docker images | grep "galeri" >> docker_images

echo RUNNING THE DOCKER IMAGES
echo ----------------------------
sudo docker run -dit --name web-galeri -p 80:80 web-galeri
echo Docker Images PS ID >> docker_images
sudo docker ps | grep "galeri" >> docker_images