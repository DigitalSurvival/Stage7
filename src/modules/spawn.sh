# $Id$
# The spawn module creates a new process for each command passed to it.

CHROOT_DIR="/mnt/gentoo"
OUTPUT_LOGFILE="/tmp/stage7_spawn.log"

spawn() {
	local CMD="${1}"

	debug spawn "Running command '${CMD}'"
	rm ${OUTPUT_LOGFILE}.cur 2>/dev/null
	if [ "${VERBOSE}" -ge "1" ]; then
		(eval "${CMD}" 2>&1; echo $? > /tmp/spawn_exitcode) | tee -a "${OUTPUT_LOGFILE}" "${OUTPUT_LOGFILE}".cur
	else
		(eval "${CMD}" 2>&1; echo $? > /tmp/spawn_exitcode) | tee -a "${OUTPUT_LOGFILE}" "${OUTPUT_LOGFILE}".cur >/dev/null 2>&1
	fi

	spawn_exitcode=$(</tmp/spawn_exitcode)
	rm /tmp/spawn_exitcode

	return ${spawn_exitcode}
}

spawn_chroot() {
	local CMD="${1}"

	debug spawn_chroot "Wrapping command '${CMD}' in chroot script..."

	echo -e '#!/bin/bash -l\n'${CMD}'\nexit $?' > "${CHROOT_DIR}"/var/tmp/spawn.sh
	chmod +x "${CHROOT_DIR}"/var/tmp/spawn.sh
	spawn "${linux32} chroot ${CHROOT_DIR} /var/tmp/spawn.sh"
}
