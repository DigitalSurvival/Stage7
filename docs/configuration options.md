$Id$

The following is a list of all the valid configuration options with descriptions and
valid parameters.

#todo: implement install profiles
install_options - Choose the install mode and the install profile for your install.

  Usage:
    install_options <install_mode> <install_profile>

  Parameters:
    install_mode - The install mode (normal, chroot, stage4, stage7). 
	
	  normal - A normal install works from a stage3 tarball with bootloader setup. 
	  chroot - A chroot install is the same as a normal install, except it skips 
			 the partitioning and bootloader setup. Use if you already have partitions 
			 and bootloader configured.
	  stage4 - A stage4 install is like a normal install, except that it skips straight from 
			 unpacking the stage tarball to configuring the bootloader. This is very handy 
			 for system backups.
	  stage7 - A stage7 install works from a stage3 tarball, but allows for defining feature sets
			 for a complete system.

	install_profile - Sets the system profile (desktop, desktop/openbox, hardened/server,
					  hardened/ds-server).
	
      desktop - Sets the desktop profile. Installs xorg-server package without any window managers.
	  desktop/openbox - Sets the desktop profile. Installs xorg-server package and the OpenBox window manager.
	  hardened/server - Sets a hardened server profile.
	  hardened/ds-server - Sets a hardened server profile, and configures your system with the Digital Survival feature set.
	
part - Creates a partition.

  Usage:
    part <drive> <minor> <type> [size]

  Parameters:
    drive - The drive to add this partition (such as hda, sdb, etc.).
    minor - The partition number. These should be in order.
    type  - The partition type used in fdisk (such as 82 or 83) or "extended".
    size  - The size of the partition (such as 32MB or 15GB, whole numbers
            only), '+' for remaining space, or 'n%' for percentage of remaining
            (these should only be used after all specific partition sizes are
            specified), leave blank for "extended".


mdraid - Creates a md raid array.

  Usage:
    mdraid <array> <arrayopts>

  Parameters:
    array     - Name of the array (such as md0, md1, etc.)
    arrayopts - Arguments to 'mdadm' after '--create /dev/mdX' (such as
                '-l 1 -n 2 /dev/sda2 /dev/sdb2'


lvm_volgroup - Creates a LVM volume group.

  Usage:
    lvm_volgroup <name> <devices>

  Parameters:
    name    - Name of the volume group to create.
    devices - List of block devices to include in the volume group.


lvm_logvol - Create a LVM logical volume.

  Usage:
    lvm_logvol <volgroup> <size> <name>

  Parameters:
    volgroup - name of a volume group created with 'lvm_volgroup'.
    size     - size of logical volume to pass to 'lvcreate'.
    name     - name of logical volume to pass to 'lvcreate'.


format - Formats a partition.

  Usage:
    format <device> <fs>

  Parameters:
    device - The device to format (such as /dev/hda2 or /dev/sdb4).
    fs     - The filesystem to use (such as ext2, ext3, or swap).


mountfs - Mounts a filesystem.

  Usage:
    mountfs <device> <type> <mountpoint> [mountopts]

  Parameters:
    device     - The device to mount (such as /dev/hda2 or /dev/sdb4).
    type       - Filesystem of device (use auto if you're not sure).
    mountpoint - The directory to mount the filesystem.
    mountopts  - Additional options to use when mounting.


netmount - Mounts a network filesystem.

  Usage:
    netmount <export> <type> <mountpoint> [mountopts]

  Parameters:
    export     - Path to the network filesystem (such as 1.2.3.4:/some/export).
    type       - Network filesystem type (such as nfs, smbfs, cifs, etc.).
    mountpoint - The directory to mount the filesystem.
    mountopts  - Additional options to use when mounting.


bootloader - Specify the bootloader to use (defaults to grub2 unless chroot install).

  Usage:
    bootloader <bootloader>

  Parameters:
    bootloader - The name of the bootloader to use (such as grub-legacy, lilo, or grub2).


logger - Specifies the system logger to use (defaults to syslog-ng).

  Usage:
    logger <logger>

  Parameters:
    logger - The name of the logger to use (such as sysklogd, metalog, or syslog-ng).


cron - Specify the cron daemon to use (defaults to vixie-cron).

  Usage:
    cron <cron>

  Parameters:
    cron - The name of the cron daemon to use (such as vixie-cron, 
			bcron, dcron, fcron, and cronie). you can specify 'none' 
			here to skip installing a cron daemon.
		   


rootpw - Sets the root password (required if not using rootpw_crypt).

  Usage:
    rootpw <password>

  Parameters:
    password - The plain-text password for the root user.


rootpw_crypt - Sets the root password (required if not using rootpw).

  Usage:
    rootpw_crypt <password>

  Parameters:
    password - The pre-hashed password for the root user.


stage_uri - Specifies the URI to the stage tarball (required).

  Usage:
    stage_uri <uri>

  Parameters:
    uri - URI to the location of the stage tarball. protocol can be http, https,
          ftp, or a system path.


tree_type - Specifies the Portage tree type (defaults to sync).

  Usage:
    tree_type <type> [uri]

  Parameters:
    type - The method for fetching the Portage tree (sync, webrsync, or
           snapshot). You can also use 'none' to skip this step.
    uri  - URI to the location of the Portage snapshot if you specified
           'snapshot' for the type.


bootloader_install_device - Specifies the device to install the bootloader to
                            (defaults to MBR/GPT of device /boot is on).

  Usage:
    bootloader_install_device <device>

  Parameters:
    device - device to install bootloader to (such as /dev/hda,
	 /dev/sda1, etc.).


chroot_dir - Specifies the directory to use for the chroot (defaults to
             /mnt/gentoo).

  Usage:
    chroot_dir <dir>

  Parameters:
    dir - Directory to use for the chroot.


extra_packages - Specifies extra packages to emerge.

  Usage:
    extra_packages <pkg>

  Parameters:
    pkg - package (or packages, space-separated) to emerge
	it's best to use full packges atoms in this field (such 
	as sys-apps/mlocate app-portage/eix net-misc/dhcpcd
	app-portage/gentoolkit app-portage/layman).

hostname - Sets the hostname for the system.
  
  Usage:
    hostname <hostname>
	
	Parameters:
	  hostname - The hostname of the system after the install.
	  Do not use special characters for the hostname. If left
	  blank the system's hostname will be set to "Stage7" by
	  default.
	  
genkernel_opts - Specifies extra options to pass to Genkernel.

  Usage:
    genkernel_opts <opts>

  Parameters:
    opts - The extra options to pass to Genkernel.


kernel_config_uri - Specifies the URI to a custom kernel configuration.

  Usage:
    kernel_config_uri <uri>

  Parameters:
    uri - URI to the location of the custom kernel .config file.


kernel_sources - Specifies the kernel sources to use (defaults to
                 gentoo-sources).

  Usage:
    kernel_sources <source>

  Parameters:
    source - Kernel sources to emerge (such as gentoo-sources, vanilla-sources,
	 or hardened-sources).


bootloader_kernel_args - Specifies extra command line arguments to pass to the kernel.

  Usage:
    bootloader_kernel_args <args>

  Parameters:
    args - Extra commandline arguments to pass to the kernel.


timezone - Specifies the timezone.

  Usage:
    timezone <tz>

  Parameters:
    tz - Timezone to use (relative to /usr/share/zoneinfo/)
	 (such as 'America/Denver', 'America/Kentucky/Louisville',
	  or 'America/Los_Angeles').


rcadd - Adds the specified service to the specified runlevel.

  Usage:
    rcadd <service> <runlevel>

  Parameters:
    service  - Name of service to add.
    runlevel - Runlevel which to add service.


rcdel - Removes the specified service from the specified runlevel.

  Usage:
    rcdel <service> <runlevel>

  Parameters:
    service  - Name of service to remove.
    runlevel - Runlevel to remove service from (usually not required).


net - Sets up networking.

  Usage:
    net <device> <ip/dhcp> [gateway]

  Parameters:
    device  - Network device (such as eth0).
    ip/dhcp - Static IP address, "dhcp" or 
              "current", which tries to use the current configuration.
    gateway - Gateway IP if using a static IP.


skip - Skips an install step.

  Usage:
    skip <install step>

  Parameters:
    install step - The name of install step to skip.

#todo/untested
server - Specify a Stage7 server.

  Usage:
    server <host>[:<port>]

  Parameters:
    host - Hostname or IP address of the Stage7 server.
    port - Port server is listening on (defaults to 8899).


use_linux32 - Enable the use of linux32 for doing 32ul installs on 64-bit boxes.

  Usage:
    use_linux32


verbose - Enable verbose mode (same as --verbose).

  Usage:
    verbose
