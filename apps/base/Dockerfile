FROM docker:18.03
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara base"
ENTRYPOINT ["/bin/entrypoint"]
EXPOSE 22

ARG TZ="UTC"
ARG LANG="en_US.UTF-8"

ENV SHELL="/bin/zsh" \
    TZ=${TZ} \
    LANG=${LANG} \
    LC_ALL=${LANG}

RUN \
  apk add --no-cache --upgrade xterm screen && \
# build dependencies
  apk add --no-cache --virtual build-deps \
    tzdata && \
# iaguara dependencies
  apk add --no-cache \
    curl \
    bash \
    git \
    htop \
    jq \
    make \
    openssh \
    tmux \
    wget \
    zsh && \
# configure timezone
  cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
  echo "${TZ}" > /etc/TZ && \
# cleanup
  apk del build-deps

COPY rootfs /
WORKDIR /data
CMD ["tmux", "-2"]
