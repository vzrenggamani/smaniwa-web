#!/bin/bash

if [ -f docker_images ]; then
echo Creating Simple Logs
rm ./docker_images
touch docker_images
else
rm ./docker_images
touch docker_images
fi

echo BUILDING DOCKER IMAGES FILES
echo ----------------------------
docker build --compress -t web-galeri .
docker images | grep "galeri" >> docker_images

echo RUNNING THE DOCKER IMAGES
echo ----------------------------
docker run -dit --rm --name web-galeri -p 80:80 web-galeri
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