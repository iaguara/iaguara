FROM iaguara/docker
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara base"

EXPOSE 22

ARG TZ="UTC"
ARG LANG="en_US.UTF-8"

ENV SHELL="/bin/zsh" \
    TZ=${TZ} \
    LANG=${LANG} \
    LC_ALL=${LANG}

RUN \
  set -eu; \
  ia_log "Base>" "Installing the build dependencies"; \
    apk add --no-cache --virtual build-deps \
      tzdata; \
  ia_log "Base>" "Installing the packages"; \
    apk add --no-cache \
      bash \
      ca-certificates \
      curl \
      gnupg \
      htop \
      jq \
      make \
      ncurses \
      openssl \
      openssh \
      python3 \
      tmux \
      wget \
      zsh; \
  ia_log "Base>" "Configuring timezone"; \
    cp /usr/share/zoneinfo/${TZ} /etc/localtime; \
    echo "${TZ}" > /etc/TZ; \
  ia_log "Base>" "Cleaning up"; \
    apk del build-deps;

COPY rootfs /

WORKDIR /data
ENTRYPOINT [\
  "/usr/local/bin/docker-entrypoint.sh", \
  "/usr/local/bin/ia_alpine_entrypoint", \
  "/usr/local/bin/ia_base_entrypoint" \
]
CMD ["tmux", "-2"]
