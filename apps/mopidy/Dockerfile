FROM debian:stretch-slim
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Mopidy"

RUN \
# mopidy dependencies
  apt-get update && \
  apt-get install -y \
    --no-install-recommends \
    alsa-utils \
    apt-transport-https \
    bash \
    ca-certificates \
    curl \
    gstreamer1.0-alsa \
    gnupg \
    netcat \
    python-pip \
    python-setuptools && \
# mopidy repositories
  curl 'http://apt.mopidy.com/mopidy.gpg' \
    | apt-key add - && \
  echo "deb http://apt.mopidy.com/ stable main contrib non-free" \
    | tee -a /etc/apt/sources.list && \
# mopidy
  apt-get update && \
  apt-get install -y \
    --no-install-recommends \
    mopidy \
    mopidy-alsamixer \
    mopidy-spotify \
    mopidy-spotify-tunigo \
    ncmpcpp && \
  pip install --upgrade \
    spotipy \
    Mopidy-Spotify-Web && \
# cleanup
  rm -rf /var/lib/apt/lists/*

COPY rootfs /
ENTRYPOINT ["/bin/entrypoint"]
