#!/usr/bin/env bash

WHAT=stxxl
VERSION=1.4.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget http://freefr.dl.sourceforge.net/project/stxxl/stxxl/${VERSION}/${WHAT}-${VERSION}.tar.gz
tar xvfz ${WHAT}-${VERSION}.tar.gz

mv ${WHAT}-${VERSION} ${VERSION}
mkdir ${VERSION}-build
cd ${VERSION}-build
cmake ../${VERSION} -DCMAKE_INSTALL_PREFIX=${TARGETDIR}
make install
cd ${TARGETDIR}/lib
ln -s libstxxl_debug.a libstxxl.a
