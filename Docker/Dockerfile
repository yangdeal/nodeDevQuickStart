FROM node:10.5.0-alpine

EXPOSE 4000 8000

RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

RUN apk --update add openjdk8-jre

RUN mkdir -p /code
WORKDIR /code

RUN npm install -g serverless

COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod 755 /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
