# $Id$
# This is an example of a profile that could be used for a x86 server. It is essentially Andrew Gaffney's
# Quickstart profile example with some of the new functionality added to Stage7. Use it as an example.

# Add an example link to a stage3 file.
stage_uri https://sourceforge.net/p/dsgentoo/code/ci/master/tree/stages/x86/stage3-i686-20140225.tar.bz2?format=raw

# Add an example link to portage snapshot.
tree_type snapshot https://sourceforge.net/p/dsgentoo/code/ci/master/tree/snapshots/portage-20140302.tar.bz2?format=raw

# Sets the install mode for the system
install_mode normal

# Sets the hostname for your new system.
hostname DigitalSurvival

# Sets the root password. For security purposes you MUST specify a root password.
rootpw password

# "grub" defaults to Grub 2. You can also use use "grub-legacy", "lilo", or "none" (each without the quotes).
# If Grub 2 is used and EFI is desired, you'll need to specify a FAT32 formatted /boot/efi directory in the partitions below...
bootloader grub

# Specifies how you want your partition layout to look after the install.
part hda 1 83 100M
part hda 2 82 512M
part hda 3 83 +

# Creates the file systems on the partitions.
format /dev/hda1 ext2
format /dev/hda2 swap
format /dev/hda3 ext3

# Mounts the partitions.
mountfs /dev/hda1 ext2 /boot
mountfs /dev/hda2 swap
mountfs /dev/hda3 ext3 / noatime

# Defines network interface names and their connection types
net eth0 dhcp

# Here you can define network file system mounts.
#netmount 192.168.0.12:/usr/portage nfs /usr/portage ro

# Modifies the system's make.conf
post_install_portage_tree() {
  cat > ${chroot_dir}/etc/portage/make.conf <<EOF
CHOST="i686-pc-linux-gnu"
CFLAGS="-O2 -march=athlon-xp -pipe"
CXXFLAGS="\${CFLAGS}"
USE="-X -gtk -gnome -kde -qt"
EOF

  echo "portdbapi.auxdbmodule = cache.metadata_overlay.database" > ${chroot_dir}/etc/portage/modules
}
