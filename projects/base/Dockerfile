FROM docker:stable
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara base"
ENTRYPOINT ["/bin/entrypoint"]
EXPOSE 22

ARG TZ="UTC"
ARG LOCALE="en_US.UTF-8"
ARG GIT_USER_NAME
ARG GIT_USER_EMAIL

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
    git \
    jq \
    openssh \
    tmux \
    wget \
    zsh && \
# configure timezone
  cp /usr/share/zoneinfo/${TZ} /etc/localtime && \
  echo "${TZ}" > /etc/TZ && \
# git configs
  git config --global user.name "${GIT_USER_NAME}" && \
  git config --global user.email "${GIT_USER_EMAIL}" && \
# cleanup
  apk del build-deps

COPY rootfs /
WORKDIR /data
CMD ["tmux", "-2"]
