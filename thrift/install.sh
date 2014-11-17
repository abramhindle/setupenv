#!/usr/bin/env bash

VERSION=0.9.2

wget http://ftp.fau.de/apache/thrift/${VERSION}/thrift-${VERSION}.tar.gz
tar xvfz thrift-${VERSION}.tar.gz
mv thrift-${VERSION} src
mkdir ${VERSION}
mv src ${VERSION}
cd ${VERSION}/src

#CXXFLAGS="-std=c++11 -Wreserved-user-defined-literal"
export PY_PREFIX=`realpath ..`/bin
./configure \
  --prefix=`realpath ..`/bin \
  --disable-tests \
  --without-qt4 \
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

make -j4
make install
cd ../..
cp setupenv.sh ${VERSION}
