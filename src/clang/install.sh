#!/usr/bin/env bash

WHAT=clang
VERSION=3.6.2
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}
BUILDDIR=`mktemp -d /tmp/build-${WHAT}-${VERSION}-XXXXXXXXXX`
TARBALLDIR=`pwd`

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

wget -N http://llvm.org/releases/${VERSION}/llvm-${VERSION}.src.tar.xz
wget -N http://llvm.org/releases/${VERSION}/cfe-${VERSION}.src.tar.xz
wget -N http://llvm.org/releases/${VERSION}/libcxxabi-${VERSION}.src.tar.xz
wget -N http://llvm.org/releases/${VERSION}/libcxx-${VERSION}.src.tar.xz
wget -N http://llvm.org/releases/${VERSION}/openmp-${VERSION}.src.tar.xz
wget -N http://llvm.org/releases/${VERSION}/compiler-rt-${VERSION}.src.tar.xz
wget -N http://llvm.org/releases/${VERSION}/clang-tools-extra-${VERSION}.src.tar.xz

echo >&2 "building in ${BUILDDIR}"
cd ${BUILDDIR}

tar xvf ${TARBALLDIR}/llvm-${VERSION}.src.tar.xz

cd llvm-${VERSION}.src/tools
tar xvf ${TARBALLDIR}/cfe-${VERSION}.src.tar.xz
mv cfe-${VERSION}.src clang

cd clang/tools
tar xvf ${TARBALLDIR}/clang-tools-extra.src.tar.xz

cd ../../../projects
tar xvf ${TARBALLDIR}/compiler-rt.src.tar.xz
tar xvf ${TARBALLDIR}/libcxxabi-${VERSION}.src.tar.xz
tar xvf ${TARBALLDIR}/libcxx-${VERSION}.src.tar.xz

cd ../..
mkdir build
cd build

../llvm-${VERSION}.src/configure --prefix=${TARGETDIR} --enable-cxx11 --enable-optimized


echo >&2 "building in ${BUILDDIR}"
exit 1


cd llvm-${VERSION}.src
cd tools
ln -s ../../cfe-${VERSION}.src clang
cd ..
./configure --enable-shared --prefix=${TARGETDIR}
make
make install
cd ..

