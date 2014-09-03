#!/bin/bash
PATCH_DIR=`pwd`
TOP_DIR=`pwd`/..
projectname=null

echo "****************************************************************"
echo "This script will clean all applied patches"
echo "****************************************************************"
echo "****************************************************************"
echo "List of all patches to clean"
echo "****************************************************************"
# Se muestran los parches que se van a aplicar
find . -name *.patch
echo "****************************************************************"
echo "Cleaning patched code"
echo "****************************************************************"
# Se crea un bucle con la búsqueda de cada uno de los parches que se encuentran dentro del directorio actual
for i in `find . -name *.patch | sed 's|./||'`; do
# Se separa el directorio del nombre del parche (p.e. bionic/patch01.patch pasa a ser bionic)
projectname=`dirname $i`
cd ../$projectname
# Se limpian los parches anteriores
git checkout -f
git clean -df
cd $PATCH_DIR
done

