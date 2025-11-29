FROM node:20-alpine

ARG N8N_VERSION=1.119.2

# install dependencies
RUN apk add --update graphicsmagick tzdata

# install build tools for node-gyp
RUN apk --update add --virtual build-dependencies python3 build-base

# install n8n
RUN npm install -g n8n@${N8N_VERSION}

# remove build tools
RUN apk del build-dependencies

WORKDIR /data
EXPOSE 5678

CMD ["n8n"]

