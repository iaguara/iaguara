FROM alpine/git:latest AS oka
RUN \
# clone env
  git clone \
    --quiet \
    --depth=1 \
    --single-branch \
    -b master \
    https://github.com/iaguara/oka.git \
    /root && \
  printf "\
[include]\n\
  path = ~/.oka/git/.gitconfig\n\
" | tee /root/.gitconfig && \
# install oh-my-zsh
  git clone \
    --quiet \
    --depth=1 \
    --single-branch \
    -b master \
    https://github.com/robbyrussell/oh-my-zsh.git \
    /root/.oh-my-zsh && \
# install tpm
  git clone \
    --quiet \
    --depth=1 \
    --single-branch \
    -b master \
    https://github.com/tmux-plugins/tpm.git \
    /root/.tmux/plugins/tpm && \
# clone pandoc filter
  git clone \
    --no-checkout \
    --quiet \
    --single-branch \
    --branch=master \
    --depth=1 \
    https://github.com/scotthartley/pandoc-chem-struct.git \
    /root/.pandoc/filters/pandoc-chem-struct && \
  cd /root/.pandoc/filters/pandoc-chem-struct && \
  git checkout HEAD pandoc-chem-struct pandoc_chem_struct && \
  rm -rf .git && \
# get abntex2 templates
  mkdir -p /root/.pandoc/templates && \
  wget -O /root/.pandoc/templates/abntex2.latex \
    https://raw.githubusercontent.com/abntex/abntex2-contrib/master/pandoc/abntex2.latex

FROM tianon/true
MAINTAINER Fiuza <fiuzagr@gmail.com>
COPY --from=oka /root /root
VOLUME /root
