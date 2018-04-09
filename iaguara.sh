#!/usr/bin/env sh

rootPath=$(cd -P -- "$(dirname -- "${0}")" && printf '%s\n' "$(pwd -P)")

export IAGUARA_HOME=${IAGUARA_HOME:-$rootPath}
export IAGUARA_RC="${IAGUARA_HOME}/iaguara.sh"

iaguara() {
  local command="${1}"
  local baseDir="${IAGUARA_HOME}/projects/base"

  # remove first argument
  [ $# -ne 0 ] && shift

  env sh -c "cd ${baseDir}; make ${command}"
}
