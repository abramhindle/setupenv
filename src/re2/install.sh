#!/usr/bin/env bash

WHAT=re2
VERSION=`git ls-remote https://github.com/google/re2.git HEAD | cut -f 1 | head -c 8`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/google/re2.git ${VERSION}

cd ${VERSION}

make -e prefix=${TARGETDIR}
make -e prefix=${TARGETDIR} install
