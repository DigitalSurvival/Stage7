# $Id$

get_device_size_in_mb() {
	local DEVICE="${1}"

	if [ -h "${DEVICE}" ]; then
		DEVICE=$(readlink ${DEVICE})
	fi
	
	DEVICE=$(echo ${DEVICE} | sed -e 's:^/dev/::;s:/:\\/:g')
	expr $(expr $(awk "/${DEVICE}\$/ { print \$3; }" /proc/partitions) / 1024) - 2 # just to make sure we don't go past the end of the drive
}

human_size_to_mb() {
	local size="${1}"
	local device_size="${2}"

	debug human_size_to_mb "size=${size}, device_size=${device_size}"
	if [ "${size}" = "+" -o "${size}" = "" ]; then
		debug human_size_to_mb "Size is + or blank...using rest of drive."
		size=""
		device_size=0
	else
		local number_suffix="$(echo ${size} | sed -e 's:\.[0-9]\+::' -e 's:\([0-9]\+\)\([MmGg%]\)[Bb]\?:\1|\2:')"
		local number="$(echo ${number_suffix} | cut -d '|' -f1)"
		local suffix="$(echo ${number_suffix} | cut -d '|' -f2)"
		debug human_size_to_mb "number_suffix='${number_suffix}', number=${number}, suffix=${suffix}"
		case "${suffix}" in
		M|m)
			size="${number}"
			device_size="$(expr ${device_size} - ${size})"
		;;
		G|g)
			size="$(expr ${number} \* 1024)"
			device_size="$(expr ${device_size} - ${size})"
		;;
		%)
			size="$(expr ${device_size} \* ${number} / 100)"
		;;
		*)
			size="-1"
			device_size="-1"
		esac
	fi
	debug human_size_to_mb "size=${size}, device_size=${device_size}"
	echo "${size}|${device_size}"
}

format_devnode() {
	local DEVICE="${1}"
	local partition="${1}"
	local devnode=""

	echo "${DEVICE}" | grep -q '[0-9]$'
	if [ $? = "0" ]; then
		devnode="${DEVICE}p${partition}"
	else
		devnode="${DEVICE}${partition}"
	fi
	echo "${devnode}"
}

# todo: verify printf to insure POSIX compatibility
fdisk_command() {
	local DEVICE="${1}"
	local cmd="${2}"

	debug fdisk_command "Running fdisk command '${cmd}' on device ${DEVICE}"
	spawn "printf '${cmd}\nw\n' | fdisk ${DEVICE}"
	return $?
}

# todo: Adding functionality for Parted...
# todo: change the echo -en to printf to insure POSIX compatibility 
parted_command() {
	local DEVICE="${1}"
	local cmd="${2}"

	debug parted_command "Running parted command '${cmd}' on device ${DEVICE}"
	spawn "printf '${cmd}\nw\n' | parted ${DEVICE}"
}

sanity_check_config_partition() {
	debug sanity_check_config_partition "No arch-specific partitioning config sanity check function."
}

local arch=$(get_arch)
if [ -f "modules/partition_${arch}.sh" ]; then
	debug partition.sh "Loading arch-specific module partition ${arch}.sh"
	import partition_${arch}
fi
