#!/bin/bash

# Written by Matthew Marchese for the Stage7 project.
# Site: http://www.DigitalSurvival.us/Stage7
# Source: https://github.com/DigitalSurvival/Stage7

# Description: This script automatically generates downloadable packages for Stage7.

# Choose the kind of compressed packages to be generated
create_bz2="yes"
create_gz="yes"
create_xz="yes"

# Generates the package version from the version variable of the main script
VERSION=`grep VERSION ../stage7.sh | awk -F= '{ print $2 }'`

basename=`basename $0`
verbose=0

# Verify dependancies are installed; warn if something not available
command_list=(bzip2 cut date echo find grep gzip hostname mount sh split tar umount uname which xz)
 
# verify that each command we use exists. if one can't be found use $PATH and make a suggestion if possible.
for command in ${command_list[@]}; do
        if [ ! -x "`which $command 2>&1`" ]; then
                echo -e "\nERROR: $command not found! "
                base=`basename $command`
                if [ "`which $base 2>&1 | grep "no \`basename $command\` in"`" != "" ]; then
                        echo -e "ERROR: $base is not in your \$PATH."
                fi
                exit -1
        fi
done

# Options for the tar command
tarOptions="--preserve-permissions --create --absolute-names --ignore-failed-read --file"

packageLocation="../../packages"

stage7PackageName=stage7-${VERSION}.tar

includedFiles="../modules/* ../stage7.sh"

# todo: check to see if the tar file already exists, if so, then warn
if [ -e ${packageLocation}/${stage7PackageName} ]; then
echo -en "A tar file with the same name (${stage7PackageName}) already exists in the package directory.\nDo you want to overwrite? (y/n): "
read answer
  if [ ${answer} == "y" ]; then
  tar ${tarOptions} ${packageLocation}/${stage7PackageName} ${includedFiles}
  else
  echo -e "Not overwriting the file."
  exit 1
  fi
else
tar ${tarOptions} ${packageLocation}/${stage7PackageName} ${includedFiles}
fi

if [ ${create_bz2} == "yes" ]; then
bzip2 --keep --compress --show-progress --force -9 ${packageLocation}/${stage7PackageName}
fi

if [ ${create_gz} == "yes" ]; then
gzip --keep --name --force --recursive --best ${packageLocation}/${stage7PackageName}
fi

if [ ${create_xz} == "yes" ]; then
xz --compress --keep --force --format=xz --extreme -9 ${packageLocation}/${stage7PackageName}
fi

rm ${packageLocation}/${stage7PackageName}

if [ {$verbose} == "yes" ]; then
echo -e "The package script has successfully created your package(s)."
fi