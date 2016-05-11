# $Id$

run_emerge() {
  PKGS="${1}"

  debug emerge "Portage packages are: '${PKGS}'"
  spawn_chroot "emerge ${emerge_opts} ${PKGS}"
}
