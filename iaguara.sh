#!/usr/bin/env sh

rootPath=$(cd -P -- "$(dirname -- "${0}")" && printf '%s\n' "$(pwd -P)")

export IAGUARA_HOME=${IAGUARA_HOME:-$rootPath}
export IAGUARA_RC="${IAGUARA_HOME}/iaguara.sh"

projectsPath="${IAGUARA_HOME}/projects"

iaguara() {
  local projectDir="${projectsPath}/${1}"

  if [ -d "${projectDir}" ]
  then
    # remove first argument
    [ $# -ne 0 ] && shift
  else
    projectDir="${projectsPath}/base"
  fi

  env make -C ${projectDir} "${@}"
}
