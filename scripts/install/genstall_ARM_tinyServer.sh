#!/bin/bash

# Created by Matthew Marchese, 2-28-2014
# This is free software. Feel free use, modify, or redistribute it as needed.
# It is my goal for it to be helpful to you.

# If you like the direction of my thinking, please visit
# http://www.digitalsurvival.us
# If you really like me, please donate to this cause.

#TODO Check to see if there is a newer version of the Digital Survival Gentoo installer script set. 

echo 
echo "You are running version Digital Survival's Gentoo Install Script for the ARM server platform."
echo "If you need to stop the script press ctrl+c"
echo 

# $Id$

stage_uri https://sourceforge.net/p/dsgentoo/code/ci/master/tree/stages/amd64/stage3-amd64-20140227.tar.bz2?format=raw

tree_type snapshot https://sourceforge.net/p/dsgentoo/code/ci/master/tree/snapshots/portage-20140302.tar.bz2?format=raw

rootpw password
# "grub" now defaults to grub 2.
bootloader grub

part hda 1 83 256M
part hda 2 82 3G
part hda 3 83 +

format /dev/hda1 ext4
format /dev/hda2 swap
format /dev/hda3 ext4

mountfs /dev/hda1 ext4 /boot
mountfs /dev/hda2 swap
mountfs /dev/hda3 ext4 / noatime

net eth0 dhcp

#netmount 192.168.0.12:/usr/portage nfs /usr/portage ro

#Still need to set the correct chost variable
post_install_portage_tree() {
  cat > ${chroot_dir}/etc/make.conf <<EOF
CHOST="i686-pc-linux-gnu"
CFLAGS="-O2 -march=k8 -pipe"
CXXFLAGS="\${CFLAGS}"
USE="-X -gtk -gnome -kde -qt"
EOF

  echo "portdbapi.auxdbmodule = cache.metadata_overlay.database" > ${chroot_dir}/etc/portage/modules