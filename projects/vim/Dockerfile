FROM alpine:latest AS builder

ENV COMPILED_BY="fiuzagr" \
    BUILD_DIR=/tmp/vim \
    INSTALL_DIR=/vim \
    VIM_FILES=/vim/usr/local/share/vim/vim80 \
    RUBY_COMMAND=/usr/bin/ruby \
    PYTHON_CONFIG_DIR=/usr/lib/python2.7/config \
    PYTHON3_CONFIG_DIR=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu

ENV PACKAGES="\
build-base \
curl \
git \
gnupg \
libffi \
libffi-dev \
libx11-dev \
libxpm-dev \
libxt-dev \
lua-dev \
luajit-dev \
make \
ncurses-dev \
perl-dev \
python-dev \
python3-dev \
ruby \
ruby-dev \
tar \
"

RUN \
  apk add --no-cache ${PACKAGES} && \
# install fpm
  gem update --no-ri --no-rdoc --system && \
  gem install --no-ri --no-rdoc fpm && \
# clone vim repo
  git clone \
    --quiet \
    --depth=1 \
    --single-branch \
    -b master \
    https://github.com/vim/vim ${BUILD_DIR} && \
  cd ${BUILD_DIR} && \
  VIM_VERSION=$(git describe --abbrev=0 --tags) && \
# configure installation
  ./configure \
    --with-features=huge \
    --with-x \
    --enable-cscope \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp \
    --enable-luainterp \
    --enable-fontset \
    --enable-largefile \
    --enable-fail-if-missing \
    --disable-gui \
    --disable-netbeans \
    --with-luajit \
    --with-ruby-command=${RUBY_COMMAND} \
    --with-python-config-dir=${PYTHON_CONFIG_DIR} \
    --with-python3-config-dir=${PYTHON3_CONFIG_DIR} \
    --with-compiledby=${COMPILED_BY} && \
# install on INSTALL_DIR
  rm -rf ${INSTALL_DIR} && \
  make && \
  make install DESTDIR=${INSTALL_DIR} && \
  cd ${INSTALL_DIR} && \
# install vim-plug
  mkdir -p ${VIM_FILES}/autoload && \
  chown -R 755 ${VIM_FILES} && \
  echo "Downloading vim-plug..." && \
  curl -SL --progress-bar \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    --output ${VIM_FILES}/autoload/plug.vim && \
# generate vim package
  fpm \
    --input-type dir \
    --output-type apk \
    --name vim \
    --version ${VIM_VERSION} \
    --no-auto-depends \
    --depends ctags \
    --depends git \
    --depends libice \
    --depends libsm \
    --depends libx11 \
    --depends libxt \
    --depends lua \
    --depends luajit \
    --depends ncurses \
    --depends perl \
    --depends python \
    --depends python3 \
    --depends ruby \
    --depends nodejs \
    --depends findutils \
    --depends diffutils \
    --depends openjdk8-jre \
    . && \
  mv *.apk /

FROM alpine:latest
MAINTAINER Fiuza <fiuzagr@gmail.com>
LABEL description="Latest Vim from source (+python +python3 +ruby +lua +perl) with vim-plug on Alpine Linux"

COPY --from=builder /vim*.apk /tmp/vim.apk

RUN \
# install build deps
  apk add --no-cache --virtual build-deps \
    build-base make gcc python3-dev musl-dev ruby-dev curl && \
# install vim package
  apk add --no-cache --allow-untrusted /tmp/vim.apk && \
# update pip, gem and npm
  pip3 install --upgrade pip && \
  gem update --no-ri --no-rdoc --system && \
  npm install -g npm@latest && \
# install vim deps
  pip3 install neovim && \
# install some linters
  # js based
  npm install -g eslint prettier prettier-standard stylelint alex sonarjs && \
  # python based
  pip3 install vim-vint proselint gitlint && \
  # ruby based
  gem install --no-ri --no-rdoc sqlint && \
  # kotlin
  echo "Downloading ktlint..." && \
  curl -SL --progress-bar \
    https://github.com/shyiko/ktlint/releases/download/0.20.0/ktlint \
    --output /usr/local/bin/ktlint && \
  chmod a+x /usr/local/bin/ktlint && \
# cleanup
  rm -rf /tmp/vim.apk && \
  apk del build-deps

WORKDIR /data
CMD ["vim"]
