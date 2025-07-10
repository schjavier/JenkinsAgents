FROM jenkins/inbound-agent:alpine-jdk17

USER root

RUN apk update &&\
    apk add --no-cache git \
    curl  \
    maven  \
    docker \
    gcompat \
    &&\
    rm -rf /var/cache/apk/*

# Intalacion de docker-compose
ENV DOCKER_COMPOSE_VERSION=v2.38.2
RUN mkdir -p /usr/local/lib/docker/cli-plugins && \
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 -o /usr/local/lib/docker/cli-plugins/docker-compose && \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
USER jenkins