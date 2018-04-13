#!/usr/bin/env sh

rootPath=$(cd -P -- "$(dirname -- "${0}")" && printf '%s\n' "$(pwd -P)")

export IAGUARA_HOME=${IAGUARA_HOME:-$rootPath}
export IAGUARA_RC="${IAGUARA_HOME}/iaguara.sh"

iaguara() {
  local project="${1}"
  local projectDir="${IAGUARA_HOME}/projects/${project}"

  if [ -d "$projectDir" ]
  then
    # remove first argument
    [ $# -ne 0 ] && shift
  else
    project=base
  fi

  env make -C ${projectDir} ${project} "${@}"
}
