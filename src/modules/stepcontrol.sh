# $Id$

isaFUNC() {
	local FUNC="${1}"

	if [ -n "$(LC_ALL=C type ${FUNC} 2>/dev/null | grep "function")" ]; then
		return 0
	else
		return 1
	fi
}

runstep() {
  local FUNC=$1
  local DESCR=$2

  local SKIPFUNC=$(eval $(echo echo "\${skip_${FUNC}}"))
  if [ "${SKIPFUNC}" != "1" ]; then
    notify "${DESCR}"
    if [ -n "${SERVER}" ]; then
      server_send_request "update_status" "FUNC=${FUNC}&DESCR=$(echo "${DESCR}" | sed -e 's: :+:g')"
    fi
    if $(isafunc pre_${FUNC}); then
      debug runstep "Executing pre-hook for ${FUNC}"
      pre_${FUNC}
    fi
    ${FUNC}
    if $(isafunc post_${FUNC}); then
      debug runstep "Executing post-hook for ${FUNC}"
      post_${FUNC}
    fi
  else
    debug runstep "Skipping step ${FUNC}"
  fi
}
