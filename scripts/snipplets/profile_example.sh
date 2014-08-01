# $Id$

stage_uri

tree_type snapshot

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
}
