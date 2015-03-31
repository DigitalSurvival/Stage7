#TODO Check to see if network needs configured.
# Network configuration most likely works.

# Starting the SSH Daemon to make it possible to troubleshoot or configure remotely
/etc/init.d/sshd start

# Create the system and boot mount points for the new system
mkdir -p /mnt/gentoo/boot

# TODO pass 1 or 2 arguments to this script for the hostname and root password
# Prompt the user to enter a hostname for their new Gentoo system
if [ "$(hostname)" == "livecd" ]; then
  echo You will need to change the hostname of the system before you continue.
  echo This can be done by passing the hostname as an augument to this script or
  echo by using the hostname command. Example: hostname New_Virtual_System
  exit 1
fi

# TODO add logic for root password passed as an argument
# If the root password has not been passed as an argument then
# set the root password to "password"
RootPass=${RootPass:-password}
echo -e "${RootPass}\n${RootPass}\n" | passwd

# Sync the system's time
ntpdate pool.ntp.org &

#TODO Make the script work with drives larger than 2TB. Possibly use parted. 
#TODO Make the script handle raid arrays
