#!/bin/bash
echo "-----build docker image:"
docker build --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy}  --build-arg no_proxy=${no_proxy} -t nodedequickstart Docker

echo "-----docker run image:"
docker run -it --rm -v ${PWD}:/code -p 3000:3000 -p 8000:8000 -e http_proxy=${http_proxy} -e https_proxy=${https_proxy}  -e no_proxy=${no_proxy} nodedequickstart /bin/bash
