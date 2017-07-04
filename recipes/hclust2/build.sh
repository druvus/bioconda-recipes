#!/bin/bash
cp $RECIPE_DIR/setup.py $SRC_DIR
mkdir hclust2
mv hclust2.py hclust2
cp __init__.py hclust2/__main__.py
mv __init__.py hclust2

$PYTHON setup.py install
