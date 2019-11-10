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
docker build -t --compress web-galeri .
echo Docker Images ID >> docker_images
docker images | grep "galeri" >> docker_images

echo RUNNING THE DOCKER IMAGES
echo ----------------------------
docker run -dit --rm --name web-galeri -p 80:80 web-galeri
echo Docker Images PS ID >> docker_images
docker ps | grep "galeri" >> docker_images

echo ==========================================
echo BUILDING GALERI WEB IS DONE!
echo ----
echo current dir : $PWD
echo current user : $USER
echo ----
echo Container Details :
cat docker_images
echo ==========================================