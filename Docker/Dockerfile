FROM openjdk:8-jre

RUN mkdir /var/dynamodb_local

WORKDIR /var/dynamodb_local

VOLUME ["/dynamodb_local_db"]

ENV DYNAMODB_VERSION=latest

ENV DYNAMODB_PORT=8000

ENV JAVA_OPTS=

RUN curl -sL -O https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_${DYNAMODB_VERSION}.tar.gz && \
    curl -sL -O https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256 && \
    sha256sum -c dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256 && \
    tar zxvf dynamodb_local_${DYNAMODB_VERSION}.tar.gz && \
    rm dynamodb_local_${DYNAMODB_VERSION}.tar.gz dynamodb_local_${DYNAMODB_VERSION}.tar.gz.sha256

RUN apt update && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs net-tools && \
	echo "===> clean up..."  && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g serverless
RUN serverless config credentials --provider aws --key 1234 --secret 5678

COPY bashrc.template.sh /root/.bashrc
COPY entrypoint.sh /tmp/entrypoint.sh
RUN chmod 755 /tmp/entrypoint.sh

RUN mkdir -p /code
WORKDIR /code

ENV DYNAMODB_PORT=8000
ENV JAVA_OPTS=

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

# FROM node:10.5.0

# RUN apt-get update && \
#     apt-get install -y openjdk-7-jre net-tools

# RUN echo "===> clean up..."  && \
#     apt-get clean  && \
#     rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /code
# WORKDIR /code

# RUN npm install -g serverless
# RUN serverless config credentials --provider aws --key 1234 --secret 5678

# COPY bashrc.template.sh /root/.bashrc
# COPY entrypoint.sh /tmp/entrypoint.sh
# RUN chmod 755 /tmp/entrypoint.sh

# ENTRYPOINT [ "/tmp/entrypoint.sh" ]
