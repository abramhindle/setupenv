#!/usr/bin/env bash
git clone git://git.savannah.gnu.org/stow.git
mv stow src

VERSION=`date +%Y-%m-%d`
mkdir ${VERSION}
mv src ${VERSION}
cd ${VERSION}/src

autoreconf
./configure --prefix=`realpath ../../../..`/build/stow-${VERSION}

touch texi2html
chmod oug+x texi2html

make
make install
cd ../..
cp setupenv.sh ${VERSION}
