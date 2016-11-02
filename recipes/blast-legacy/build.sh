#!/bin/bash

# move all extracted files (folder content) to 'ncbi' subdir,
# since path hierarchy required by make files
mkdir ncbi;
mv `ls | grep -v ncbi` ./ncbi/.;

# edit make targets to disable X11 (keep copy for debug)
for f in ./ncbi/platform/*.mk; do
  # disable OPENGL dependent make targets
  sed -i '.ori' 's/#set HAVE_OGL=0/set HAVE_OGL=0/' $f;
  # disable MOTIF make target
  sed -i '' 's/#set HAVE_MOTIF=0/set HAVE_MOTIF=0/' $f;
  # reduce compilation warnings
  sed -i '' 's/NCBI_CC = gcc/NCBI_CC = gcc -Wcpp -Wimplicit-int -Wimplicit-function-declaration -Wincompatible-pointer-types /' $f;
done

# run compilation (populates './ncbi/build/')
csh ncbi/make/makedis.csh

# copy built executables to $PREFIX
cp `find ./ncbi/build/ -type f -executable` $PREFIX/.
# copy all libraries
mkdir $PREFIX/lib;
cp ./ncbi/build/*.a $PREFIX/lib/.
# copy all headers
mkdir $PREFIX/include;
cp ./ncbi/build/*.h $PREFIX/include/.

