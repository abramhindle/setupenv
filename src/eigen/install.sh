#!/usr/bin/env bash

WHAT=libeigen
VERSION=3.2.2
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

# THIS NEEDS TO BE SET PROPERLY, DEPENDING ON THE VERSION
SUBDIR=eigen-eigen-1306d75b4a21

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget http://bitbucket.org/eigen/eigen/get/${VERSION}.tar.gz

tar xvfz ${VERSION}.tar.gz
mv ${SUBDIR} ${VERSION}

SOURCEDIR=`realpath ${VERSION}`

mkdir ${VERSION}-build
cd ${VERSION}-build
cmake ${SOURCEDIR} -DCMAKE_INSTALL_PREFIX=${TARGETDIR}
make install
cd ..
