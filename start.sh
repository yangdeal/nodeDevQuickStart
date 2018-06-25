#!/bin/bash
echo "-----build docker image:"
docker build -t nodedequickstart Docker
echo "-----docker run image:"
docker run -it --rm -v ${PWD}:/code -p 3000:3000 -p 8000:8000 nodedequickstart
