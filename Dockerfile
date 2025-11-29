FROM node:20-alpine

ARG N8N_VERSION=1.120.4

RUN apk add --update graphicsmagick tzdata
RUN apk add --update --virtual build-dependencies python3 build-base

RUN npm install -g n8n@${N8N_VERSION}

RUN apk del build-dependencies

WORKDIR /data
EXPOSE 5678

CMD ["n8n"]
