#!/usr/bin/env bash

BASEDIR="$( cd "$( dirname "${BASH_SOURCE:-$0}" )" && pwd )"

export PATH=${BASEDIR}/bin/bin:${PATH}
export LD_LIBRARY_PATH=${BASEDIR}/bin/lib:${LD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH=${BASEDIR}/bin/lib:${DYLD_LIBRARY_PATH}
export LDFLAGS="${LDFLAGS} -L${BASEDIR}/bin/lib"
export CPPFLAGS="${CPPFLAGS} -isystem${BASEDIR}/bin/include"
export CPLUS_INCLUDE_PATH="${BASEDIR}/bin/include:${CPLUS_INCLUDE_PATH}"
export INFODIR=${BASEDIR}/bin/share/info:${INFODIR}
