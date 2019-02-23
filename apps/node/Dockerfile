ARG NODE_VERSION=10

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
    ncurses \
    openssh-client \
    python && \
  npm cache clean --force && \
  npm install -g npx@latest && \
  npm install -g yarn@latest && \
  npm install -g pnpm@latest && \
  npm config set store /usr/local/pnpm

WORKDIR /data
CMD ["node"]
