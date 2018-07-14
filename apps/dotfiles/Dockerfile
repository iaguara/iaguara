FROM alpine/git:latest AS oka
RUN \
# clone env
  git clone \
    --quiet \
    --depth=1 \
    --single-branch \
    -b master \
    https://github.com/iaguara/oka.git \
    "/oka" && \
  printf "\
[include]\n\
  path = ~/.oka/git/.gitconfig\n\
" | tee /oka/.gitconfig && \
# install oh-my-zsh
  git clone \
    --quiet \
    --depth=1 \
    --single-branch \
    -b master \
    https://github.com/robbyrussell/oh-my-zsh.git \
    "/oh-my-zsh" && \
# install tpm
  git clone \
    --quiet \
    --depth=1 \
    --single-branch \
    -b master \
    https://github.com/tmux-plugins/tpm.git \
    "/tmux-tpm"

FROM tianon/true
MAINTAINER Fiuza <fiuzagr@gmail.com>
COPY --from=oka /oka /root
COPY --from=oka /oh-my-zsh /root/.oh-my-zsh
COPY --from=oka /tmux-tpm /root/.tmux/plugins/tpm
VOLUME /root
