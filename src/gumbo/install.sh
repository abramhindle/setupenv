#!/usr/bin/env bash

WHAT=gumbo
VERSION=`git ls-remote https://github.com/google/gumbo-parser HEAD | cut -f 1 | head -c 8`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/google/gumbo-parser ${VERSION}

cd ${VERSION}

./autogen.sh
./configure --prefix=${TARGETDIR}
make
make install
