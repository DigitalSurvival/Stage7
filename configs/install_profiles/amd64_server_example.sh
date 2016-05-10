# $Id$
# Created by Matthew Marchese
# This is free software. Feel free use, modify, or redistribute it as needed.
# It is my goal for it to be helpful to you!

# If you have questions about stage7:
# http://www.digitalsurvival.us/Ssage7

# To request improvements or report issues:
# https://github.com/DigitalSurvival/Stage7/issues/new

# If you really, really like it please donate time, effort, or money to Digital Survival: 
# http://www.digitalsurvival.us/ways_to_help.html

# Description:
# This install profile is an example of what a generic AMD64 server configuration could look like.

LOCAL_MIRROR_IP=""

install_mode normal

hostname stage7-demo

stage_uri http://distfiles.gentoo.org/releases/amd64/autobuilds/current-stage3-amd64/stage3-amd64-20160505.tar.bz2

tree_type snapshot http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2

rootpw stage7

bootloader grub

fpart sda 1 83 256M
fpart sda 2 82 3G
fpart sda 3 83 20G

format /dev/sda1 ext4
format /dev/sda2 swap
format /dev/sda3 ext4

mountfs /dev/sda1 ext4 /boot
mountfs /dev/sda2 swap
mountfs /dev/sda3 ext4 / noatime

net eth0 dhcp

#netmount ${LOCAL_MIRROR_IP}:/usr/portage nfs /usr/portage ro

#Still need to set the correct chost variable
post_install_portage_tree() {
  cat > ${chroot_dir}/etc/portage/make.conf <<EOF
CHOST="i686-pc-linux-gnu"
CFLAGS="-O2 -march=k8 -pipe"
CXXFLAGS="\${CFLAGS}"
USE="-X -gtk -gnome -kde -qt"
EOF

  echo "portdbapi.auxdbmodule = cache.metadata_overlay.database" > ${chroot_dir}/etc/portage/modules
}
