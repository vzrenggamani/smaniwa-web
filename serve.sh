#!/bin/bash
docker run -dit --rm --name galeri-web -p 80:80 -v "$PWD"/public/:/usr/local/apache2/htdocs/ httpd:latest