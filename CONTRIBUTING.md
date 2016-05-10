# Contributing guidelines

Want to get involved? Hop into the #digital-survival channel on Freenode IRC and tell me about it. I am happy for any help. :)

## Dependancies

app-arch/tar (tar)
sys-fs/squashfs-tools (mksquashfs)
app-shells/bash (bash)
net-misc/wget (wget)
sys-apps/sed (sed)

## Bash

* Multi-word functions and variables should use underscores, not dashes (-).
** Example: foo_function()
* Variable names should be UPPERCASE.
** Example: FOO_BAR="1"
* Variables with string values should be properly referenced: "${FOO_BAR}"
* Indentations should be a full tab space, and a tab space should be equivlent to four single spaces.
* If statements
** Use double brackets for if stagements
** When using a variable, cite it properly (see above)


All bash code should be checked for errors at http://www.shellcheck.net/ before being committed into this repository.

## Versioning

Code used by this project follows [symantic versioning](http://semver.org/#semantic-versioning-200).
