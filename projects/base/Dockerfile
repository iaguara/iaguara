FROM docker:stable
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara base"
ENTRYPOINT ["/bin/entrypoint"]
EXPOSE 22

ARG TZ="UTC"
ARG LOCALE="en_US.UTF-8"

ENV SHELL="/bin/zsh" \
    TZ=${TZ} \
    LANG=${LOCALE} \
    LANGUAGE=${LOCALE} \
    LC_ALL=${LOCALE}

RUN \
# build dependencies
  apk add --update --no-cache --virtual build-deps \
    tzdata && \
# denver dependencies
  apk add --update --no-cache \
    curl \
    bash \
    git \
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
