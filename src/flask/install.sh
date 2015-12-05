#!/usr/bin/env bash

WHAT=flask
VERSION=0.10.1
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi


git clone http://github.com/mitsuhiko/flask.git
cd flask
git tag -l
git checkout task/${VERSION}
pip install --target="${TARGETDIR}/lib/python2.7/site-packages/" Flask
cd ..
