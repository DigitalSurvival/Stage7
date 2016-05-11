# $Id$

# This module checks to see if needed binaries are on somewhere available on
# the system path. If all binaries cannot be called directly, an error will
# be produced and logged to the standard log location

env_dep_check() {
	NUM_OF_BINS="$#"
	ALL_BINS="$@"

	# Iterate the binaries; error if something does not exist
	while [ ${#} -gt 0 ]; do
		CURRENT_BIN="${1}"
		shift
		# Check the existance of bin path
		CURRENT_BIN_PATH="$(which ${CURRENT_BIN})"
		if [ -x  "${CURRENT_BIN_PATH}" ]; then
			debug "${CURRENT_BIN} is available"
			# Sets the binary paths for system tools
			export 
		else
			error "${CURRENT_BIN} has not been found on the system path"
			exit 1
		fi
	done
}

# For after the chroot
chroot_dep_check() {
	NUM_OF_BINS="$#"
	ALL_BINS="$@"

	# Iterate the binaries; error if something does not exist
	while [ ${#} -gt 0 ]; do
		CURRENT_BIN="${1}"
		shift
		# Check the existance of bin path
		CURRENT_BIN_PATH="$(which ${CURRENT_BIN})"
		if [ -x  "${CURRENT_BIN_PATH}" ]; then
			debug "${CURRENT_BIN} is available"
		else
			error "${CURRENT_BIN} has not been found on the system path"
			exit 1
		fi
	done
}
