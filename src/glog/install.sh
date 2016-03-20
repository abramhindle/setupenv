#!/usr/bin/env bash

WHAT=glog
VERSION=0.3.4
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/google/glog.git
cd glog
git tag -l
git checkout tags/v${VERSION}

./configure --prefix=${TARGETDIR}
make
make install
