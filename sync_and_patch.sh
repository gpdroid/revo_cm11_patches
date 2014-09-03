#!/bin/bash
PATCH_DIR=`pwd`
TOP_DIR=`pwd`/..
MAKE_FLAGS=-j$((CORE_COUNT + 2))
projectname=null

./clean.sh
cd $TOP_DIR
repo sync
cd $PATCH_DIR
./patch.sh
