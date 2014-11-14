#!/usr/bin/env bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE:-$0}" )" && pwd )"

export LDFLAGS="${LDFLAGS} -L${BASEDIR}/bin/lib"
export CPPFLAGS="${CPPFLAGS} -isystem${BASEDIR}/bin/include"
export LD_RUN_PATH=${BASEDIR}/bin/lib:${LD_RUN_PATH}
export LD_LIBRARY_PATH=${BASEDIR}/bin/lib:${LD_LIBRARY_PATH}
