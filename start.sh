#!/bin/bash
docker build -t nodedequickstart Docker
docker run -it --rm -v ${PWD}:/code -p 3000:3000 -p 8000:8000 nodedequickstart
