#!/bin/bash

BINARY_HOME=$PREFIX/bin
CANU_HOME=$PREFIX/opt/canu-$PKG_VERSION

mkdir -p $BINARY_HOME
mkdir -p $CANU_HOME

cd $SRC_DIR/src
make

if [ "$(uname)" == "Darwin" ]; then
    echo "Installing CANU for OSX."
    cp -R $SRC_DIR/Darwin-amd64/bin/* $CANU_HOME
else
    echo "Installing CANU for UNIX/Linux."
    cp -R $SRC_DIR/Linux-amd64/bin/* $CANU_HOME
fi



#Linking to binfolder
chmod +x $CANU_HOME/canu
ln -s "$CANU_HOME/canu" "$BINARY_HOME/canu"
