#!/usr/bin/env bash

WHAT=cpplint.py
VERSION=1.0
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

mkdir -p ${TARGETDIR}/bin
wget http://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py
chmod oug+x cpplint.py
mv cpplint.py ${TARGETDIR}/bin/cpplint
