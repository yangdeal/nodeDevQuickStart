FROM node:10.5.0

RUN apt-get update && \
    apt-get install -y openjdk-7-jre

RUN echo "===> clean up..."  && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /code
WORKDIR /code

RUN npm install -g serverless

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod 755 /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
