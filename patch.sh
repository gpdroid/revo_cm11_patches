#!/bin/bash
PATCH_DIR=`pwd`
TOP_DIR=`pwd`/..
CORE_COUNT=`grep processor /proc/cpuinfo | wc -l`
MAKE_FLAGS=-j$((CORE_COUNT + 2))
projectname=null

echo "****************************************************************"
echo "This script will apply all patches needed to build cm11 for Geeksphone Revolution. After that, it will launch a new build"
echo "****************************************************************"
echo "****************************************************************"
echo "List of all patches"
echo "****************************************************************"
# Se muestran los parches que se van a aplicar

find . -name *.patch

echo "****************************************************************"
echo "Cleaning old patched code, patching code again"
echo "****************************************************************"

# Se crea un bucle con la búsqueda de cada uno de los parches que se encuentran dentro del directorio actual
for i in `find . -name *.patch | sed 's|./||'`; do

# Se separa el directorio del nombre del parche (p.e. bionic/patch01.patch pasa a ser bionic)
projectname=`dirname $i`

# Se limpian los parches anteriores
cd ../$projectname
git checkout -f
git clean -df

# Se ingresa en el directorio
cp -r $PATCH_DIR/$projectname/* .
patch -p1 < patch01.patch
rm -f patch01.patch
cd $PATCH_DIR
done

