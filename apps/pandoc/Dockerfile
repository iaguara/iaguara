FROM debian:stretch-slim
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Iaguara Pandoc"

RUN \
  apt-get update && \
  apt-get install -y \
    --no-install-recommends \
    lmodern \
    texlive \
    texlive-base \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-generic-recommended \
    texlive-humanities \
    texlive-lang-portuguese \
    texlive-lang-english \
    texlive-metapost \
    texlive-pictures \
    texlive-science \
    pandoc \
    pandoc-citeproc \
    pandoc-data \
    python3-pandocfilters && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /data
CMD ["pandoc"]
