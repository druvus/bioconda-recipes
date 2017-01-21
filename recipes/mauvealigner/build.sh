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

#libgenome
cd libGenome 
mkdir -p config
autoreconf --force --install -I config  -I m4
./configure --prefix=$PREFIX
make
make install

#libmuscle 
cd ../libMuscle
sed -i.bak ' s| = muscle| = |g' libMUSCLE/Makefile.am

mkdir -p config
autoreconf --force --install -I config  -I m4
./configure --prefix=$PREFIX
make
make install

#libmems
cd ../libMems
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$PREFIX/lib/pkgconfig"
mkdir -p config
autoreconf --force --install -I config  -I m4
./configure --prefix=$PREFIX  --with-boost=$PREFIX
make
make install


#mauvealigner
cd ../mauvealigner
sed -i.bak 's|-static||g' configure.ac 
mkdir -p config
autoreconf --force --install -I config
./configure --prefix=$PREFIX
make
make install
