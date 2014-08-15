#!/bin/bash

# Automatic download script is a work in progress...

# Generates the package version from the version variable of the main script
# This will always be up-to-date.
VERSION=`grep VERSION scripts/stage7.sh | awk -F= '{ print $2 }'`

wget https://github.com/DigitalSurvival/Stage7/raw/master/packages/stage7-${VERSION}.tar.xz .

mkdir ~/stage7
tar xpfJ stage7-${VERSION}.tar.xz -C ~/stage7

echo -e "Stage7 has been downloaded and extracted.\nIn order for it to work properly you will need to run it with sudo permissions."
