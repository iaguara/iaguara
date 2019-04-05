FROM docker:stable as docker
FROM iaguara/git
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Docker"

RUN \
  set -eu; \
  ia_log "Docker>" "Installing the build dependencies"; \
    apk add --no-cache --virtual build-deps \
      curl \
      python3; \
    pip3 install --quiet --upgrade pip; \
  ia_log "Docker>" "Installing docker-compose"; \
    pip3 install --quiet docker-compose~=1.23.0; \
  ia_log "Docker>" "Installing docker-machine"; \
    machineUrl="https://github.com/docker/machine/releases/download"; \
    machinePackage="docker-machine-$(uname -s)-$(uname -m)"; \
    machineVersion="v016.0"; \
    curl -#L -o /tmp/docker-machine \
      "${machineUrl}/${machineVersion}/${machinePackage}"; \
    install /tmp/docker-machine /usr/local/bin/docker-machine; \
  ia_log "Docker>" "Cleaning up"; \
    apk del build-deps;

COPY --from=docker [\
  "/usr/local/bin/docker", \
  "/usr/local/bin/modprobe", \
  "/usr/local/bin/docker-entrypoint.sh", \
  "/usr/local/bin/" \
]

ENTRYPOINT [\
  "/usr/local/bin/docker-entrypoint.sh", \
  "/usr/local/bin/ia_alpine_entrypoint" \
]
