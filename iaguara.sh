#!/usr/bin/env sh

rootPath=$(cd -P -- "$(dirname -- "${0}")" && printf '%s\n' "$(pwd -P)")

export IAGUARA_HOME=${IAGUARA_HOME:-$rootPath}
export IAGUARA_RC="${IAGUARA_HOME}/iaguara.sh"
export IAGUARA_BIN="${IAGUARA_HOME}/bin"
export IAGUARA_APPS="${IAGUARA_HOME}/apps"

export PATH="${IAGUARA_BIN}:${PATH}"

iaguara() {
  local appDir="${IAGUARA_APPS}/${1}"

  if [ -d "${appDir}" ]
  then
    # remove first argument
    [ $# -ne 0 ] && shift
  else
    appDir="${IAGUARA_APPS}/base"
  fi

  env make -C ${appDir} "${@}"
}
