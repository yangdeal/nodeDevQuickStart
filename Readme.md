# Node development quick start
This repo is for Nodejs develpers quick start AWS lambda developement work .

Developer can quickly start work in his local laptop without AWS account or connection by few commands. 

The code developerd under this images will work seemless when deployed to AWS.

## What packages included:
1. node
2. npm
3. serverless framework
4. serverless-dynamodb-local 
5. serverless-dynamodb-client 
6. serverless-offline
7. dynamodb

## Limitations
- Only support Nodejs development. Java is not supported as serverless framework support Nodejs only

## Todo
- Test code on windows. Currently the code tested in Mac enviroment
- Test proxy. Currently the code tested in under the enviroment without proxy

## Benifit to run the enviroment using docker
- quick start, just run docker command
- OS independent, it can run on Windows, Linux or Mac
- consistance configure accross all developer
- consistance configure accross all enviroments, developement, SIT or even prod
- Easy for CI/CD deployment

## Pre-requirements
- docker (to run the enviroment)
- visual studio code (recommded for JavaScript IDE)

## Getting start
1. Download the code
2. run commands (Mac/Linux)
    ```bash
    docker build -t nodeDevQuickStart Docker
    docker run -it --rm -v ${PWD}:/code -p 4000:4000 -p 8000:8000 nodeDevQuickStart
    ```
3. Link to your code repo

    ```bash
    ## git
    echo "# nodeDevQuickStart" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin [Your repo link]
    git push -u origin master
    ```

## How to use

The API link is http://localhost:3000. When making change in the working directory, it reflect by a simple browser refresh.

Dynamodb console can be access by http://localhost:8000/shell. In the code, no special setting is required while serverless offline plugin used.

1. Git clone your team code repo (initialled from getting start)
2. run commands
    ```bash
    docker build -t nodeDevQuickStart Docker
    docker run -it --rm -v ${PWD}:/code -p 4000:4000 -p 8000:8000 nodeDevQuickStart
    ```
3. start coding

# Reference
- [serverless](https://serverless.com/)
- [serverless offline](https://www.npmjs.com/package/serverless-offline)
- [serverless dynamodb local](https://www.npmjs.com/package/serverless-dynamodb-local)




