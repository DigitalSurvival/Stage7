#!/usr/bin/env sh
# $Id$

VERSION_X="0" # Major
VERSION_Y="1" # Minor
VERSION_Z="1" # Patch/bugfix
STABILITY_TAG="-alpha"

VERSION="${VERSION_X}.${VERSION_Y}.${VERSION_Z}${STABILITY_TAG}"

# Output variables
DEBUG=0
VERBOSE=0
QUITE=0

ME="$(whoami)"

if [ "${ME}" != "root" ]; then
	printf "stage must be run with root privileges. Try again.\n" && exit 1
fi


if [ -d ./modules ]; then
	MODULE_DIR="./modules"
elif [ -d ./src/modules ]; then
	MODULE_DIR="./src/modules"
elif [ ! -z "${MODULE_DIR}" ]; then
	MODULE_DIR="${MODULE_DIR}" # Defined on command-line
else
	printf "Cannot locate modules direcory." && exit 1
fi

SANITY_CHECK=0

import() {
	local MODULE="${1}"

	if [ ! -f "${MODULE_DIR}/${MODULE}.sh" ]; then
		printf "Module '%s' appears to be missing from %s. Re-installing should fix the problem.\n" "${MODULE}" "${MODULE_DIR}"
		exit 1
	else
		"${MODULE_DIR}"/"${MODULE}".sh
		if [ "${DEBUG}" -gt "0" ]; then
			printf "import imported %s/%s module" "${MODULE_DIR}" "${MODULE}"
		fi
	fi
}

usage() {
	MSG="${1}"

	if [ -n "${MSG}" ]; then
		printf "%s.\nEnter 'stage --help' for help.\n" "${MSG}"
	else
	cat <<EOF
Usage:
  stage [--global-options] <subcommand> [--subcommand-options] [--subcommand-arguments]
  
Global stage options:

  -h|--help            Show this message and exit. Follow this option with a
					   valid command to narrow help scope.
  -q|--quiet           Only output fatal error messages. Use this option when
					   no output is desired.
  -v|--verbose         Be verbose (show command output).
  -V|--version         Print version and exit. 

  backup subcommand options:

  stage [--global-options] backup [--command-options] [--command-arguments]

    -ef|--exclude-file	   Specify a path to an exclude file.
    -e|--exclude		   Files or directories to exclude.
    -c|--compression	   Type of compression to use: gz, bz2, or xz
  
  install subcommand options:

  stage [--global-options] install [--command-options] [--command-arguments]

    -c|--client <host>   Act as a client and connect to a staged server.
    -d|--debug           Output debugging messages.
    -p|--profile		 Specify a path to a profile. 
    -s|--sanity-check    Sanity check install profile and exit.

  recover subcommand options:

  stage [--global-options] recover [--command-options] [--command-arguments]

For example:

stage -v install --profile /path/to/profile

Copyright (C) 2014-2016 Matthew Marchese
EOF
  fi
}

# These modules are always needed and therefore will be included by default
import output
import config
import stepcontrol
import depcheck

# Parse arguments
while [ "${#}" -gt 0 ]; do
	CMDLINE_INPUT="${1}"
	shift
	case "${CMDLINE_INPUT}" in
	backup|install|recover)
		echo "backup, install, or recover passed"
	;;
	-p|--profile)
		# Profile path should be the second argument if -p|--profile
		INSTALL_PROFILE="${2}"
	;;
	-h|--help)
		usage
		exit 0
	;;
	-b|--backup)
		usage "Unfortunately the backup option is not yet implemented. Check back for updates!"
		BACKUP_LOCATION="${1}"
		BACKUP_PROFILE="${2}"
		import rescue.sh
		shift
		exit 0
	;;
	-c|--client)
		usage "Unfortunately the client option may be considerably altered or eliminated. It has been disabled for now..."
		#SERVER="${1}"
		shift
		exit 0
	  ;;
	-d|--debug)
		DEBUG="1"
	  ;;
	-q|--quiet)
		if [ "${VERBOSE}" -ge 1 ]; then
			usage "The --quiet and --verbose options are mutually exclusive. Choose only one."
			exit 1
		fi
		QUITE="1"
	  ;;
	-s|--sanity-check)
		SANITY_CHECK="1"
	  ;;
	-v|--verbose)
		if [ "${QUITE}" -ge 1 ]; then
			usage "The --quiet and --verbose options are mutually exclusive. Choose only one."
			exit 1
		fi
		VERBOSE="1"
	  ;;
	-V|--version)
		printf "stage7 version %s\nCopyright (C) 2014-2016 Matthew Marchese\nLicense GPLv2: GNU GPL version 2.\n\n" "${VERSION}"
		printf "To file a bug or to request a feature please visit:\nhttp://www.github.com/DigitalSurvival/Stage7\n\n"
		printf "This is free software; you are free to change and redistribute it.\nThere is NO WARRANTY, to the extent permitted by law.\n"
		exit 0
	  ;;
	-*)
		usage "Invalid option specified: ${INPUT_A}"
		exit 1
	  ;;
	*)
		INSTALL_PROFILE="${CMDLINE_INPUT}"
	  ;;
	esac
done

# Dep check
#bin_dep_check "atftp mdadm parted wget awk tar sed chpasswd mount fdisk swapoff swapon grep ifconfig hostname rc-update cat chmod dd echo expr ln mkdir rm sort uname cut head sort tee mkfs.btrfs mkfs.ext2 mkfs.ext3 mkfs.ext4 mkfs.reiserfs mkfs.vfat mkfs.ntfs rsync"

if [ -n "${SERVER}" ]; then
	server_init
	if server_get_profile; then
		PROFILE="/tmp/stage7_profile"
	fi
fi

if [ -z "${INSTALL_MODE}" ]; then
	usage "An install mode must be specified"
	exit 1
fi

if [ -z "${INSTALL_PROFILE}" ]; then
	usage "An install profile must be specified"
	exit 1
fi

if [ ! -f "${INSTALL_PROFILE}" ]; then
	error "Specified install profile does not exist"
	exit 1
else
	. "${INSTALL_PROFILE}"

	#todo
	# Import default modules unless module_import is defined in <profile> or stage4 selected as install_mode.
	if [ -n "${MODULE_IMPORT}" ]; then

		echo "inside module_import: ${MODULE_IMPORT}"
		debug import "Adding profile-defined custom module(s)"

		# change this while loop to for loop?
		while [ "${MODULE_IMPORT}" -gt 0 ]; do
			local CUSTOM_MODULE=${1}
			shift
			echo "import ${CUSTOM_MODULE}"
			import "${CUSTOM_MODULE}"
		done

	elif [ "${INSTALL_MODE}" = "stage4" ]; then  
		echo "inside module_import: ${MODULE_IMPORT}"
		debug import "Install mode set to stage4. Not importing."
	else
		echo "in else: ${MODULE_IMPORT}"
		debug import "Adding default modules."
		import misc
		import spawn
		import fetcher
		import portage
		import bootloader
		import partition
		import install_steps
		#import config
		#import server
	fi

	if ! touch "${LOGFILE}" 2>/dev/null; then
		error "Log file located at ${LOGFILE} is not writeable!"
		exit 1
	fi

	ARCH=$(get_arch)
	debug main "Arch is ${ARCH}"
	[ -z "${ARCH}" ] && die "Could not determine arch!"
	runstep sanity_check_config "Sanity checking config..."

	if [ "${SANITY_CHECK}" = "1" ]; then
		debug main "Exiting due to --sanity-check"
		exit 1
	fi
fi

if [ "${INSTALL_MODE}" = "stage4" ]; then
	printf "I've been passed stage4.\n"
else
	usage "Set the install mode to chroot, normal, or stage4 and try again."
exit 1

fi

run_pre_install_script "Running pre-install script..."

if [ "${INSTALL_MODE}" != "chroot" ]; then 
	runstep partition "Partitioning..."
fi

runstep setup_md_raid "Setting up RAID arrays..."
# todo: Add support for Btrfs RAID.
runstep setup_lvm "Setting up LVM volumes..."
runstep format_devices "Formatting devices..."
runstep mount_local_partitions "Mounting local partitions..."
runstep mount_network_shares "Mounting network shares..."
runstep unpack_stage_tarball "Fetching and unpacking stage tarball..."
runstep prepare_chroot "Preparing chroot..."

if [ "${INSTALL_MODE}" != "stage4" ]; then
	runstep install_portage_tree "Installing Portage tree..."
	runstep set_root_password "Setting root password..."
	runstep set_hostname "Setting system hostname..."
	runstep set_timezone "Setting timezone."
	runstep setup_fstab "Setting up /etc/fstab"
	runstep build_kernel "Building kernel..."
	runstep install_logging_daemon "Installing logging daemon..."
	runstep install_cron_daemon "Installing cron daemon..."
	runstep setup_network_post "Setting up post-install networking..."
	runstep install_bootloader "Installing bootloader..."
fi

if [ "${INSTALL_MODE}" != "chroot" ]; then
	runstep configure_bootloader "Configuring bootloader..."
fi

runstep install_extra_packages "Installing specified extra packages..."
runstep add_and_remove_services "Adding and removing services..."
runstep run_post_install_script "Running post-install script..."
runstep finishing_cleanup "Cleaning up..."

notify "Install complete!"

if [ "${REBOOT}" = "yes" ]; then
	notify "Rebooting system. Please standby..."
	reboot
fi
