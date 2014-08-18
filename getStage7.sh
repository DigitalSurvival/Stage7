#!/bin/bash

# Automatic download script is a work in progress...

# Generates the package version from the version variable of the main script
# The versioning should always be up-to-date this way.
VERSION=`grep VERSION scripts/stage7.sh | awk -F= '{ print $2 }'`

wget https://github.com/DigitalSurvival/Stage7/raw/master/packages/stage7-${VERSION}.tar.xz .

mkdir ~/stage7
tar xpfJ stage7-${VERSION}.tar.xz -C /stage7

#todo
echo -e "Stage7 has been downloaded and extracted to a directory created at /stage7\n"
echo -e "In order for it to work properly you will need to run it with sudo permissions."
echo -e "\nIf you know what you're doing move to /stage7 and start the script with \"sudo ./stage7.sh\""
echo -e "If not, then you should read the wiki at https://github.com/DigitalSurvival/Stage7/wiki"
echo -e "Or visit the website at http://www.digitalsurvival.us/stage7"

