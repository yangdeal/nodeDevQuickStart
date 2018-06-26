#!/bin/bash

if [ ! -d "/code/node_modules" ]; then
    npm install
    npm install serverless-dynamodb-client serverless-offline
else
    echo "=================="
    echo "Folder ./node_modules found, assume all packages installed."
    echo "Remove ./node_modules from host and re run the script to trigger packages reinstall."
    echo "=================="
fi

# start DynamoDB local
java -Djava.library.path=. ${JAVA_OPTS} -jar /var/dynamodb_local/DynamoDBLocal.jar -port ${DYNAMODB_PORT} -inMemory > /var/log/dynamodb.log &

sls offline start > /var/log/serverless.log &

echo -n "Strating services."
i=0
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:3000/non-exist)" != "404" ]]; 
	do 
		echo -n .
		sleep 1
		i=$(($i+1))
		if [ $i -gt 5 ]; then break; fi
	done
echo ""

npm test test/test-api.js test/test-dynamodb.js

echo "=================="
echo "Development enviroment ready. Please check above API gateway and DynamoDB status."
echo "Access API gateway: http://localhost:8000/shell/"
echo "Access DynamoDB console: http://localhost:3000/hello"
echo "Check dynamodb and serverless log under /var/log"
echo "Run npm command in this window. Use \"nt\" for \"npm test\" shortcut"
echo "Using your favorate IDE to write code in your host maching working directory, enjoy"
echo "=================="
echo ""
echo ""

/bin/bash