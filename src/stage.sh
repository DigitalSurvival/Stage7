#!/bin/sh
# $Id$

VERSION="0.1.1-alpha"

# Option variables
debug=0
verbose=0
quiet=0
sanitycheck=0

import() {
  local module="${1}"

  if [ -f "${module}.sh" ]; then
  error "Module ${module}.sh appears to be missing. Re-installing Stage7 should fix the problem."
  exit 1
  else
  . modules/${module}.sh
  debug import "Imported module ${module}"
  fi
}

usage() {
  msg=$1

  if [ -n "${msg}" ]; then
    printf "${msg}\n"
    else
    cat <<EOF
Usage:
  stage [--global-options] <command> [--command-options] [--command-arguments]
  
Global options:

  -h|--help            Show this message and exit. Follow this option with a
					   valid command to narrow help scope.
  -q|--quiet           Only output fatal error messages. Use this option when
					   no output is desired.
  -v|--verbose         Be verbose (show command output).
  -V|--version         Print version and exit. 

Backup options:

  stage [--global-options] backup [--command-options] [--command-arguments]

  -e|--exclude		   Files or directories to exclude.
  -c|--compression	   Type of compression to use: gz, bz2, or xz
  
Install options:

  stage [--global-options] install [--command-options] [--command-arguments]

  -c|--client <host>   Act as a client and connect to a staged server.
  -d|--debug           Output debugging messages.
  -p|--profile		   Specify a path to a profile. 
  -s|--sanity-check    Sanity check install profile and exit.

Recover options:

  stage [--global-options] recover [--command-options] [--command-arguments]

EOF
  fi
}

# These modules are always needed and therefore will be included by default
import output
import config
import stepcontrol
import depcheck

# Parse arguments
while [ ${#} -gt 0 ]
do
  a=${1}
  b=${2}
  shift
  case "${a}" in
    -h|--help)
      usage
      exit 0
      ;;
   -b|--backup)
    usage "Unfortunately the backup option is not yet implemented. Check back for updates!"
    backup_location=${1}
    backup_profile=${2}
    import rescue.sh
    shift
    exit 0
    ;;
    -c|--client)
      usage "Unfortunately the client option may be considerably altered or eliminated. It has been disabled for now..."
      #server=${1}
      shift
      exit 0
      ;;
    -d|--debug)
      debug=1
      ;;
    -q|--quiet)
      if [ ${verbose} = 1 ]; then
        usage "The --quiet and --verbose options are mutually exclusive. Choose only one."
        exit 1
      fi
      quiet=1
      ;;
    -s|--sanity-check)
      sanitycheck=1
      ;;
    -v|--verbose)
      if [ ${quiet} = 1 ]; then
        usage "The --quiet and --verbose options are mutually exclusive. Choose only one."
        exit 1
      fi
      verbose=1
      ;;
    -V|--version)
      printf "Stage7 version ${VERSION}\nCopyright (C) 2014 Matthew Marchese\nLicense GPLv2: GNU GPL version 2.\n\n"
      printf "To file a bug or to request a feature please visit:\nhttp://www.github.com/DigitalSurvival/Stage7\n\n"
      printf "This is free software; you are free to change and redistribute it.\nThere is NO WARRANTY, to the extent permitted by law.\n"
      exit 0
      ;;
    -*)
      usage "Invalid option specified: ${a}"
      exit 1
      ;;
    *)
      install_mode=${a}
      profile=${b}
      ;;
  esac
done

if [ -n "${server}" ]; then
  server_init
  if server_get_profile; then
    profile="/tmp/stage7_profile"
  fi
fi


if [ -z "${install_mode}" ]; then
  usage "An install mode must be specified."
  exit 1
fi

if [ -z "${install_profile}" ]; then
  usage "An install profile must be specified."
  exit 1
fi


  if [ ! -f "${profile}" ]; then
    error "Specified install profile does not exist!"
    exit 1
  else
    . "${profile}"
  
    #todo
    # Import default modules unless module_import is defined in <profile> or stage4 selected as install_mode.
    if [ -n "${module_import}" ]; then
      
      echo "inside module_import: ${module_import}"
      debug import "Adding profile-defined custom module(s)."
      # change this while loop to for loop?
      while [ ${module_import} -gt 0 ]
      do
	local module=${1}
	shift
	echo "import ${module}"
	import ${module}
      done

    elif [ "${install_mode}" == "stage4" ]; then  
      echo "inside module_import: ${module_import}"
      debug import "Install mode set to stage4. Not importing."
      
    else
    
    echo "in else: ${module_import}"
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
    
    if ! touch ${logfile} 2>/dev/null; then
      error "Logfile located at ${logfile} is not writeable!"
      exit 1
    fi
    arch=$(get_arch)
    debug main "Arch is ${arch}"
    [ -z "${arch}" ] && die "Could not determine arch!"
    runstep sanity_check_config "Sanity checking config..."
    if [ "${sanitycheck}" = "1" ]; then
      debug main "Exiting due to --sanity-check"
      exit
    fi
  fi

elif [ ${install_mode}="stage4" ]; then
printf "I've been passed stage4.\n"



else
usage "Set the install mode to chroot, normal, or stage4 and try again."
exit 1

fi



run_pre_install_script "Running pre-install script..."

if [ "${install_mode}" != "chroot" ]; then 
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

if [ "${install_mode}" != "stage4" ]; then
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

if [ "${install_mode}" != "chroot" ]; then
  runstep configure_bootloader "Configuring bootloader..."
fi



runstep install_extra_packages "Installing specified extra packages..."
runstep add_and_remove_services "Adding and removing services..."
runstep run_post_install_script "Running post-install script..."
runstep finishing_cleanup "Cleaning up..."

notify "Install complete!"

if [ "${reboot}" = "yes" ]; then
  notify "Rebooting system. Please standby..."
  reboot
fi
