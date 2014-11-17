#!/usr/bin/env bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE:-$0}" )" && pwd )"

export PATH=${BASEDIR}/bin/bin:${PATH}
export MANPATH=${BASEDIR}/bin/share/man:${MANPATH}
#export LD_LIBRARY_PATH=${BASEDIR}/bin/lib:${LD_LIBRARY_PATH}
#export LDFLAGS="${LDFLAGS} -L${BASEDIR}/bin/lib"
#export CPPFLAGS="${CPPFLAGS} -isystem${BASEDIR}/bin/include"
