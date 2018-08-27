ARG NODE_VERSION=8

FROM node:${NODE_VERSION}-alpine
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Node.js"

RUN \
# remove old yarn
  rm -rf /usr/local/bin/yarn && \
  rm -rf /usr/local/bin/yarnpkg && \
  rm -rf /opt/yarn* && \
  apk add --no-cache \
    autoconf \
    automake \
    g++ \
    git \
    libpng-dev \
    libtool \
    make \
    nasm \
    openssh-client \
    python && \
  npm cache clean --force && \
  npm install -g npx@latest && \
  npm install -g yarn@latest

WORKDIR /data
CMD ["node"]
