#!/usr/bin/env sh

rootPath=$(cd -P -- "$(dirname -- "${0}")" && printf '%s\n' "$(pwd -P)")

# ids
export IA_UID="$(id -u)"
export IA_GID="$(id -g)"
export IA_DOCKER_GID="$(stat -c "%g" /var/run/docker.sock)"

# configurable paths
export IA_HOME="${IA_HOME:-$rootPath}"
export IA_APPS="${IA_APPS:-$IA_HOME}"
export IA_DATA="${IA_DATA:-"${HOME}/workspace"}"

# fixed paths
export IA_RC="${IA_HOME}/iaguara.sh"
export IA_BIN="${IA_HOME}/bin"

# host machine variables
export HOST_HOME="${HOST_HOME:-$HOME}"
export COLUMNS="$(tput cols)"
export LINES="$(tput lines)"

# configure user path
export PATH="${PATH}:${IA_BIN}"

# iaguara alias
ia() {
  iaguara "${@}"
}
