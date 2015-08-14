#!/usr/bin/env bash

WHAT=git
VERSION=2.4.5
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N https://www.kernel.org/pub/software/scm/git/git-${VERSION}.tar.gz

tar xvfz git-${VERSION}.tar.gz
mv git-${VERSION} ${VERSION}

cd ${VERSION}
make prefix=${TARGETDIR}
make prefix=${TARGETDIR} install
cd ..
