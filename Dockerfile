FROM node:20-alpine

ARG N8N_VERSION=latest

RUN apk add --update graphicsmagick tzdata

USER root

RUN apk --update add --virtual build-dependencies python3 build-base && \
    npm install -g n8n@${N8N_VERSION} && \
    apk del build-dependencies

WORKDIR /data

EXPOSE 5678

CMD ["n8n"]
