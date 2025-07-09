FROM jenkins/inbound-agent:alpine-jdk17

USER root

RUN apk update &&\
    apk add --no-cache git \
    curl  \
    maven  \
    docker \
    &&\
    rm -rf /var/cache/apk/*

#Libreria necesaioa para correr docker compose en alpine linux

ENV GLIBC_VERSION 2.35-r1
RUN apk add --no-cache ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
    apk add --no-cache glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
    rm glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk

# Intalacion de docker-compose
ENV DOCKER_COMPOSE_VERSION=1.29.2
RUN curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

USER jenkins