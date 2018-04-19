ARG NODE_VERSION=8

FROM node:${NODE_VERSION}-alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Node.js"

RUN \
  apk add --no-cache \
    autoconf \
    automake \
    g++ \
    git \
    libpng-dev \
    libtool \
    make \
    nasm \
    openssh-client && \
  npm install -g npx@latest

WORKDIR /data
CMD ["node"]
