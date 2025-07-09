FROM jenkins/inbound-agent:alpine-jdk17

USER root

RUN apk update &&\
    apk add --no-cache git \
    curl  \
    maven  \
    docker \
    &&\
    rm -rf /var/cache/apk/*

#Libreria necesaria para correr docker compose en alpine linux
RUN apk add --no-cache gcompat

# Intalacion de docker-compose
ENV DOCKER_COMPOSE_VERSION=1.29.2
RUN curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

USER jenkins