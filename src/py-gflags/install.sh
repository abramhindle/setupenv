#!/usr/bin/env bash

WHAT=py-gflags
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/google/python-gflags ${VERSION}

cd ${VERSION}

python ./setup.py build

cp -R build ${TARGETDIR}
cd ..
