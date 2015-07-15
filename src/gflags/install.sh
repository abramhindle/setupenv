#!/usr/bin/env bash

WHAT=gflags
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone git@github.com:gflags/gflags.git
mv gflags ${VERSION}

mkdir ${VERSION}-build

cd ${VERSION}-build
cmake ../${VERSION} -DCMAKE_INSTALL_PREFIX=${TARGETDIR} -DGFLAGS_NAMESPACE=google -DBUILD_SHARED_LIBS=true
make install

# we additionally need to copy this dir
cp -R include ${TARGETDIR}
cd ..
