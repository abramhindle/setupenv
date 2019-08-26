#!/usr/bin/env bash

WHAT=gtest
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone https://github.com/google/googletest.git ${VERSION}
cd ${VERSION}
git checkout -b unravel-bespoke-version `git rev-list -n 1 --before="2016-07-30 00:00" master`
cd ..


mkdir -p ${VERSION}/googletest/build
cd ${VERSION}/googletest/build

cmake .. -DBUILD_SHARED_LIBS=true
make

mkdir -p ${TARGETDIR}/lib/
cp *.so ${TARGETDIR}/lib
cp -R ../include ${TARGETDIR}

cd ../../
mkdir -p googlemock/build
cd googlemock/build

cmake .. -DBUILD_SHARED_LIBS=true
make
cp *.so ${TARGETDIR}/lib
cp -R ../include ${TARGETDIR}
