#!/usr/bin/env bash

WHAT=thrift
VERSION=0.9.3
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://ftp.fau.de/apache/thrift/${VERSION}/${WHAT}-${VERSION}.tar.gz
tar xvfz ${WHAT}-${VERSION}.tar.gz
mv ${WHAT}-${VERSION} ${VERSION}
cd ${VERSION}

#CXXFLAGS="-std=c++11 -Wreserved-user-defined-literal"
export PY_PREFIX=${TARGETDIR}
./configure \
  --prefix=${TARGETDIR} \
  --disable-tests \
  --without-qt4 \
  --with-cpp \
  --with-python \
  --without-php \
  --without-lua \
  --without-csharp \
  --without-java \
  --without-erlang \
  --without-nodejs \
  --without-lua \
  --without-perl \
  --without-php \
  --without-php_extension \
  --without-ruby \
  --without-haskell \
  --without-go \
  --without-d

make
make install
cd ..
