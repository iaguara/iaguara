#!/usr/bin/env sh

rootPath=$(cd -P -- "$(dirname -- "${0}")" && printf '%s\n' "$(pwd -P)")

export IA_HOME=${IA_HOME:-$rootPath}
export IA_WORKSPACE="${IA_WORKSPACE:-"${HOME}/workspace"}"

export IA_RC="${IA_HOME}/iaguara.sh"
export IA_BIN="${IA_HOME}/bin"
export IA_APPS="${IA_HOME}/apps"

export PATH="${IA_BIN}:${PATH}"

iaguara() {
  local appDir="${IA_APPS}/${1}"

  if [ -d "${appDir}" ]
  then
    # remove first argument
    [ $# -ne 0 ] && shift
  else
    appDir="${IA_APPS}/base"
  fi

  env make -C ${appDir} "${@}"
}

ia() {
  iaguara "${@}"
}
