#!/usr/bin/env bash

WHAT=stow
VERSION=`date +%Y-%m-%d`
TARGETDIR=`realpath ../../build`/${WHAT}-${VERSION}

if [ -d "${TARGETDIR}" ]; then
  echo >&2 "${TARGETDIR} already exists"
  exit 1
fi

git clone git://git.savannah.gnu.org/stow.git
mv stow ${VERSION}
cd ${VERSION}

autoreconf
./configure --prefix=${TARGETDIR}

touch texi2html
chmod oug+x texi2html

make
make install
cd ..
