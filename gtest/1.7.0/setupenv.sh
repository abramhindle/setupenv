#!/usr/bin/env bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE:-$0}" )" && pwd )"

export LD_LIBRARY_PATH=${BASEDIR}/src/lib:${LD_LIBRARY_PATH}
export LDFLAGS="${LDFLAGS} -L${BASEDIR}/src/lib"
export CPPFLAGS="${CPPFLAGS} -isystem${BASEDIR}/src/include"
