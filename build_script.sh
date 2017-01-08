#!/usr/bin/env bash
docker build -t bso-jenkins .
if [ 0 -ne $? ]; then echo "build failed";  exit 1; fi

docker run -u root --rm -it bso-jenkins linkchecker
if [ 0 -ne $? ]; then echo "linkchecker is broken."; exit 1; fi

docker run -u root --rm -it bso-jenkins linkchecker -r 0 http://www.google.com
if [ 0 -ne $? ]; then echo "linkchecker for http failed."; exit 1; fi

docker run -u root --rm -it bso-jenkins linkchecker -r 0 https://www.google.com
if [ 0 -ne $? ]; then echo "linkchecker for SSL/https failed."; exit 1; fi
