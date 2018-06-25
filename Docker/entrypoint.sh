#!/bin/bash

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

echo -n "Strating serverless offline."
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:3000/non-exist)" != "404" ]]; do echo -n .; sleep 1; done
echo ""
echo "Serverless offline ready, enjoy."
echo "use \"nt\" for shortcut of \"npm test\""
echo ""
echo ""

/bin/bash