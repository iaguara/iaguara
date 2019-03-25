FROM alpine:latest
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara alpine"

COPY rootfs /

RUN \
  set -eu; \
  ia_log "Alpine>" "Installing packages"; \
    apk add --no-cache \
      su-exec;

WORKDIR /data
ENTRYPOINT ["/usr/local/bin/ia_alpine_entrypoint"]
