FROM debian:stretch-slim
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Tizonia"

RUN \
# tizonia dependencies
  apt-get update && \
  apt-get install -y \
    --no-install-recommends \
    apt-transport-https \
    bash \
    build-essential \
    ca-certificates \
    curl \
    git \
    gnupg \
    libffi-dev \
    libpulse0 \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    alsa-utils \
    python-dev \
    python-pip \
    python-pkg-resources \
    python-setuptools \
    python-wheel \
    && \
# tizonia repositories
  curl 'http://apt.mopidy.com/mopidy.gpg' \
    | apt-key add - && \
  echo "deb http://apt.mopidy.com/ stable main contrib non-free" \
    | tee -a /etc/apt/sources.list && \
  curl -k 'https://bintray.com/user/downloadSubjectPublicKey?username=tizonia' \
    | apt-key add - && \
  echo "deb https://dl.bintray.com/tizonia/debian stretch main" \
    | tee -a /etc/apt/sources.list && \
# tizonia python2 dependencies
  pip2 install --upgrade \
    eventlet \
    fuzzywuzzy \
    gmusicapi \
    pafy \
    pychromecast \
    pycountry \
    python-levenshtein \
    plexapi \
    soundcloud \
    titlecase \
    youtube-dl && \
  pip2 install --upgrade \
    git+https://github.com/plamere/spotipy.git && \
# tizonia
  apt-get update && \
  apt-get install -y \
    libspotify12 \
    tizonia-all && \
# cleanup
  apt-get purge --auto-remove -y \
    build-essential \
    curl \
    git \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    python-dev \
    python-pip \
    python-pkg-resources \
    python-setuptools \
    python-wheel && \
  rm -rf /var/lib/apt/lists/*

COPY rootfs /
CMD ["tizonia"]
