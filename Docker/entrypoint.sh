#!/bin/sh

if [ ! -d "/code/node_modules" ]; then
    npm install
    npm install serverless-dynamodb-local serverless-dynamodb-client serverless-offline
    sls dynamodb install
else
    echo "=================="
    echo "Folder ./node_modules found, assume all packages installed."
    echo "Remove ./node_modules from host and re run the script to trigger packages reinstall."
    echo "=================="
fi

sls offline start > /var/log/serverless.log &

/bin/bash