#!/bin/bash

# fix automake
sed -i.bak '1 s|^.*$|#!/usr/bin/env perl|g' $PREFIX/bin/aclocal
sed -i.bak '1 s|^.*$|#!/usr/bin/env perl|g' $PREFIX/bin/automake

# fix autoconf
sed -i.bak '1 s|^.*$|#!/usr/bin/env perl|g' $PREFIX/bin/autom4te
sed -i.bak '1 s|^.*$|#!/usr/bin/env perl|g' $PREFIX/bin/autoheader
sed -i.bak '1 s|^.*$|#!/usr/bin/env perl|g' $PREFIX/bin/autoreconf
sed -i.bak '1 s|^.*$|#!/usr/bin/env perl|g' $PREFIX/bin/ifnames
sed -i.bak '1 s|^.*$|#!/usr/bin/env perl|g' $PREFIX/bin/autoscan
sed -i.bak '1 s|^.*$|#!/usr/bin/env perl|g' $PREFIX/bin/autoupdate

export INCLUDE_PATH="${PREFIX}/include"
export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"

export LDFLAGS="-L${PREFIX}/lib"
export CPPFLAGS="-I${PREFIX}/include"

mkdir -p $PREFIX/bin

./autogen.sh 
./configure --prefix=$PREFIX
make 
make install
