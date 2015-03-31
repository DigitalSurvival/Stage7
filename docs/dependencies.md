Dependencies List
=====

There needs to be a few tools present in a pre-install environment on your system in order for Stage7 to work 
properly. The script should detect missing utilities and 
prompt the user for the utilities packages to be installed. In order for the user missing packages in the field a comprehensive list of required 
packages (along with package descriptions) can be found in this document.

##Pre-Install Packages:

**net-ftp/atftp**
> /usr/bin/atftp

**sys-fs/mdadm**
> /sbin/mdadm

**sys-block/parted**
> /usr/sbin/parted

**net-misc/wget**

> /usr/bin/wget

**sys-apps/gawk**
> /usr/bin/awk

**app-arch/tar**
> /bin/tar 

**sys-apps/sed**
> /bin/sed

**sys-apps/shadow**
> /usr/sbin/chpasswd

**sys-apps/util-linux**

> /bin/mount

> /sbin/fdisk

> /sbin/swapoff

> /sbin/swapon

**sys-apps/grep**
> /bin/grep

**sys-apps/net-tools**
> /bin/ifconfig

> /bin/hostname

**sys-apps/openrc**
> /sbin/rc-update

**sys-apps/coreutils**
> /bin/cat

> /bin/chmod

> /bin/dd

> /bin/echo

> /bin/expr

> /bin/ln

> /bin/mkdir

> /bin/rm

> /bin/sort

> /bin/uname

> /usr/bin/cut

> /usr/bin/head

> /usr/bin/sort

> /usr/bin/tee

**sys-fs/btrfs-progs**
> /sbin/mkfs.btrfs

**sys-fs/e2fsprogs**
> /sbin/mkfs.ext2

> /sbin/mkfs.ext3

> /sbin/mkfs.ext4

**sys-fs/reiserfsprogs**
> /sbin/mkfs.reiserfs

**sys-fs/dosfstools**
> /usr/sbin/mkfs.vfat

**sys-fs/ntfs3g**
> /usr/sbin/mkfs.ntfs

##Post-install Packages:

**app-admin/eselect**
> usr/bin/eselect

**app-portage/gentoolkit**
> /usr/bin/revdep-rebuild

**sys-apps/portage**
> /usr/bin/emerge

> /usr/bin/emerge-webrsync
