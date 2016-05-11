#!/bin/bash

# Controls the "release" version this script will download
VERSION="0.1.0"

wget https://github.com/digitalsurvival/stage7/archive/v"${VERSION}".tar.gz .
tar xpzvf v"${VERSION}".tar.gz

# Clean up
rm v0.1.0.tar.gz

#todo
printf "\nstage7 has been downloaded and extracted to './stage7-%s' directory\n\n" "${VERSION}"
printf "In order for this script work properly you will need to run it with sudo permissions.\n"
printf "For example, execute:     sudo ./stage7-%s/stage'     from this direcory\n\n" "${VERSION}"
printf "First timers can read the wiki at https://github.com/DigitalSurvival/Stage7/wiki\n"
printf "Or visit the website at http://www.digitalsurvival.us/stage7\n"
