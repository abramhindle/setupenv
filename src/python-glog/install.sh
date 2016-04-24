#!/usr/bin/env bash

WHAT=python-glog
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/mnuhn/python-glog

PYDIR=${TARGETDIR}/lib/python2.7/site-packages/glog/
mkdir -p ${PYDIR}

cp python-glog/glog.py ${PYDIR}/__init__.py
