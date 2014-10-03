

Stage7 Command-line Configuration Options

The following is a list of all the valid configuration options with descriptions and valid parameters.

#todo
install_mode — Choose the install mode and profile.

  Usage:
    install_mode <mode> <profile>

  Parameters:
    mode — The install mode (normal, chroot, stage4, stage7). Stage7
		   is the only install mode that accepts the <profile> parameter.
	
		normal — A normal install works from a stage3 tarball 
				 with bootloader setup. This will be a basic system
				 without any custom configuration besides adding a user.
		chroot — A chroot install is the same as a normal install, 
				 except it skips the partitioning and bootloader setup. 
		stage4 — A stage4 install is like a normal install, but it 
				 skips straight from unpacking the stage4 tarball to 
				 configuring the bootloader. This is very handy when restoring 
				 system backups if you have created a stage4 backups of your system(s).
		stage7 — A stage7 install works like a normal install (from a stage3 
				 tarball) but allows for "profiles" which are defining feature sets 
				 for a "complete" system.

	profile — Sets the Stage7 system profile which modifies the depth of the 
			  installs configuration.
	  
		xorg       — Installs xorg—server and xterm packages without any window managers.
		openbox    — Installs xorg—server package and the OpenBox window manager.
		ds-desktop — Installs a desktop version of Digital Survival Linux. 
					 Uses OpenBox as a base.
		server     — Sets the server profile. No xorg—server or window managers for 
				     maximum resource allocation to tasks.
		ds-server  — Installs a headless server, and configures your system with 
					 the Digital Survival feature set.
	
fpart — Creates a partition using fdisk.

  Usage:
    fpart <drive> <minor> <type> [size]

  Parameters:
    drive — the drive to add this partition (such as hda, sdb, etc.)
    minor — the partition number. These should be in order.
    type  — the partition type used in fdisk (such as 82 or 83) or "extended".
    size  — the size of the partition (such as 32MB or 15GB, whole numbers
            only), '+' for remaining space, or 'n%' for percentage of remaining
            (these should only be used after all specific partition sizes are
            specified), leave blank for "extended".

			
part — Creates a partition using parted.

  Usage:
    part <drive> <minor> <type> [size]

  Parameters:
    drive — the drive to add this partition (such as hda, sdb, etc.)
    minor — the partition number. These should be in order.
    type  — the partition type used in parted (such as ) or "extended".
    size  — the size of the partition (such as 32MB or 15GB, whole numbers
            only), '100%' for remaining space.			

mdraid — Creates a md raid array.

  Usage:
    mdraid <array> <arrayopts>

  Parameters:
    array     — name of the array (such as md0, md1, etc.)
    arrayopts — arguments to 'mdadm' after '——create /dev/mdX' (such as
                '—l 1 —n 2 /dev/sda2 /dev/sdb2'


lvm_volgroup — Creates a LVM volume group.

  Usage:
    lvm_volgroup <name> <devices>

  Parameters:
    name    — name of the volume group to create.
    devices — list of block devices to include in the volume group.


lvm_logvol — Create a LVM logical volume.

  Usage:
    lvm_logvol <volgroup> <size> <name>

  Parameters:
    volgroup — name of a volume group created with 'lvm_volgroup'.
    size     — size of logical volume to pass to 'lvcreate'.
    name     — name of logical volume to pass to 'lvcreate'.


format — Formats a partition.

  Usage:
    format <device> <fs>

  Parameters:
    device — the device to format (such as /dev/hda2 or /dev/sdb4).
    fs     — the filesystem to use (such as ext2, ext3, btrfs, or swap).


mountfs — Mounts a filesystem.

  Usage:
    mountfs <device> <type> <mountpoint> [mountopts]

  Parameters:
    device     — the device to mount (such as /dev/hda2 or /dev/sdb4).
    type       — filesystem of device (use auto if you're not sure).
    mountpoint — the directory to mount the filesystem.
    mountopts  — additional options to use when mounting.
	

netmount — Mounts a network filesystem.

  Usage:
    netmount <export> <type> <mountpoint> [mountopts]

  Parameters:
    export     — path to the network filesystem (such as 1.2.3.4:/some/export).
    type       — network filesystem type (such as nfs, smbfs, cifs, etc.).
    mountpoint — the directory to mount the filesystem.
    mountopts  — additional options to use when mounting.


bootloader — Specify the bootloader to use (defaults to Grub2).

  Usage:
    bootloader <bootloader>

  Parameters:
    bootloader — the name of the bootloader to use (such as grub—legacy, lilo, or grub2).


logger — Specifies the system logger to use (defaults to syslog—ng).

  Usage:
    logger <logger>

  Parameters:
    logger — the name of the logger to use (such as sysklogd, metalog, or syslog—ng).


cron — Specify the cron daemon to use (defaults to vixie—cron).

  Usage:
    cron <cron>

  Parameters:
    cron — the name of the cron daemon to use (such as vixie—cron, 
			bcron, dcron, fcron, and cronie). you can specify 'none' 
			here to skip installing a cron daemon.
		   


rootpw — Sets the root password (required if not using rootpw_crypt).

  Usage:
    rootpw <password>

  Parameters:
    password — the plain—text password for the root user.


rootpw_crypt — Sets the root password (required if not using rootpw).

  Usage:
    rootpw_crypt <password>

  Parameters:
    password — the pre—hashed password for the root user.


stage_uri — Specifies the URI to the stage tarball (required).

  Usage:
    stage_uri <uri>

  Parameters:
    uri — URI to the location of the stage tarball. protocol can be http, https,
          ftp, or a system path.


tree_type — Specifies the Portage tree type (defaults to sync).

  Usage:
    tree_type <type> [uri]

  Parameters:
    type — the method for fetching the Portage tree (sync, webrsync, or
           snapshot). You can also use 'none' to skip this step.
    uri  — URI to the location of the Portage snapshot if you specified
           'snapshot' for the type.


bootloader_install_device — Specifies the device to install the bootloader to
                            (defaults to MBR of device /boot is on)

  Usage:
    bootloader_install_device <device>

  Parameters:
    device — device to install bootloader to (such as /dev/hda,
	 /dev/sda1, etc.).


chroot_dir — Specifies the directory to use for the chroot (defaults to
             /mnt/gentoo).

  Usage:
    chroot_dir <dir>

  Parameters:
    dir — directory to use for the chroot.


extra_packages — Specifies extra packages to emerge.

  Usage:
    extra_packages <pkg>

  Parameters:
    pkg — package (or packages, space—separated) to emerge
	it's best to use full packges atoms in this field (such 
	as sys—apps/mlocate app—portage/eix net—misc/dhcpcd
	app—portage/gentoolkit app—portage/layman).

hostname — Sets the hostname for the system.
  
  Usage:
    hostname <hostname>
	
	Parameters:
	  hostname — The hostname of the system after the install.
	  Do not use special characters for the hostname. If left
	  blank the system's hostname will be set to "Stage7" by
	  default.
	  
genkernel_opts — Specifies extra options to pass to genkernel.

  Usage:
    genkernel_opts <opts>

  Parameters:
    opts — the extra options to pass to genkernel.


kernel_config_uri — Specifies the URI to a custom kernel configuration.

  Usage:
    kernel_config_uri <uri>

  Parameters:
    uri — URI to the location of the custom kernel .config file.


kernel_sources — Specifies the kernel sources to use (defaults to
                 gentoo—sources).

  Usage:
    kernel_sources <source>

  Parameters:
    source — kernel sources to emerge (such as vanilla—sources
	 hardened—sources).


bootloader_kernel_args — Specifies extra command line arguments to pass to the kernel.

  Usage:
    bootloader_kernel_args <args>

  Parameters:
    args — extra commandline arguments to pass to the kernel.


timezone — Specifies the timezone.

  Usage:
    timezone <tz>

  Parameters:
    tz — timezone to use (relative to /usr/share/zoneinfo/)


rcadd — Adds the specified service to the specified runlevel.

  Usage:
    rcadd <service> <runlevel>

  Parameters:
    service  — name of service to add
    runlevel — runlevel to add service to


rcdel — Removes the specified service from the specified runlevel.

  Usage:
    rcdel <service> <runlevel>

  Parameters:
    service  — name of service to remove
    runlevel — runlevel to remove service from (usually not required)


net — Sets up networking.

  Usage:
    net <device> <ip/dhcp> [gateway]

  Parameters:
    device  — network device (such as eth0)
    ip/dhcp — static IP address, "dhcp" or 
              "current", which tries to use the current configuration
    gateway — gateway IP if using a static IP


skip — Skips an install step.

  Usage:
    skip <install step>

  Parameters:
    install step — name of step to skip


server — Specify a Stage7 server.

  Usage:
    server <host>[:<port>]

  Parameters:
    host — hostname or IP address of the Stage7 server
    port — port server is listening on (defaults to 8899)


use_linux32 — Enable the use of linux32 for doing 32ul installs on 64—bit boxes.

  Usage:
    use_linux32


verbose — Enable verbose mode (same as --verbose)

  Usage:
    verbose
