#!/bin/sh

npm install serverless-dynamodb-local
npm install serverless-dynamodb-client
npm install serverless-offline

sls dynamodb install

# sls offline start

echo "end of entrypoint"
/bin/sh