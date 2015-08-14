#!/usr/bin/env bash

WHAT=catch
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/philsquared/Catch ${VERSION}
cd ${VERSION}

mkdir -p ${TARGETDIR}
cp -R include ${TARGETDIR}
