# $Id$
# This is an example of a profile that could be used for a x86 server.

# Add an example link to a stage3 file.
stage_uri https://sourceforge.net/p/dsgentoo/code/ci/master/tree/stages/x86/stage3-i686-20140225.tar.bz2?format=raw

# Add an example link to portage snapshot.
tree_type snapshot https://sourceforge.net/p/dsgentoo/code/ci/master/tree/snapshots/portage-20140302.tar.bz2?format=raw

# Sets the install mode for the system
install_mode normal

# Set the hostname for your new system.
hostname ExampleBox

# Sets the root password. For security purposes you MUST specify a root password.
rootpw Ex@mP1eP@$$w0rd

# "grub" defaults to Grub 2. You can also use use "grub-legacy", "lilo", or "none" (each without the quotes).
# If Grub 2 is used and EFI is desired, you'll need to specify a FAT32 formatted /boot/efi directory. 
bootloader grub

# Specifies if you want GPT (newer and recommended) or MBR partition table layout.
# If you have old hardware or if you don't know what you have you should use MBR.
partition_table_layout MBR

# Specifies if how you want your partition layout to look after the install.
part hda 1 83 256M
part hda 2 82 40G
part hda 3 83 +

# Creates the file systems on the partitions.
format /dev/hda1 ext4
format /dev/hda2 swap
format /dev/hda3 ext4

# Mounts the partitions.
mountfs /dev/hda1 ext4 /boot
mountfs /dev/hda2 swap
mountfs /dev/hda3 ext4 / noatime

# Configures the network interfaces.
net eth0 dhcp

# If you want to mount a network drive you would define it like this.
#netmount 192.168.0.12:/usr/portage nfs /usr/portage ro

# Still need to set the correct chost variable
# It would be easy to have the script include this...
post_install_portage_tree() {
  cat > ${chroot_dir}/etc/make.conf <<EOF
CHOST="i686-pc-linux-gnu"
CFLAGS="-O2 -march=k8 -pipe"
CXXFLAGS="\${CFLAGS}"
USE="-X -gtk -gnome -kde -qt"
EOF

  echo "portdbapi.auxdbmodule = cache.metadata_overlay.database" > ${chroot_dir}/etc/portage/modules
}
