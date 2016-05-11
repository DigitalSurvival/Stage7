# $Id$

# Gentooesque log colors:
GOOD='\033[32;01m'
WARN='\033[33;01m'
BAD='\033[31;01m'
HILITE='\033[36;01m'
BRACKET='\033[34;01m'
NORMAL='\033[0m'

LOGFILE="/tmp/stage7_install.log"

debug() {
	local FUNC="${1}"
	local MSG="${2}"

	if [ "${DEBUG}" = "1" ]; then
		printf "%s(): %s" "${FUNC}" "${MSG}" >&2
		log "${FUNC}(): ${MSG}"
	fi
}

notify() {
	local MSG="${1}"

	[ "${QUITE}" = "0" ] && printf " %s*%s %s\n" "${GOOD}" "${NORMAL}" "${MSG}"
	log "${MSG}"
}

error() {
	local MSG="${1}"

	printf " %s*%s %s\n" "${BAD}" "${NORMAL}" "${MSG}" >&2
	log "Error: ${MSG}"
}

die() {
	local MSG="${1}"

	error "${MSG}"
	runstep failure_cleanup "Cleaning up after install failure."
	exit 1
}

warn() {
	local MSG="${1}"

	[ "${QUITE}" = "0" ] && printf " %s*%s %s\n" "${WARN}" "${NORMAL}" "${MSG}" >&2
	log "Warning: ${MSG}"
}

#todo: Make sure new date command works properly.
log() {
	local MSG="${1}"

	if [ -n "${LOGFILE}" -a -f "${LOGFILE}" ]; then
		printf "$(date '+%b %d, %Y %T - '): %s" "${MSG}" >> "${LOGFILE}" 2>/dev/null
	fi
}
