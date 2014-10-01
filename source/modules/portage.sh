# $Id$

run_emerge() {
  pkgs=$1

  debug emerge "Portage packages are: '${pkgs}'"
  spawn_chroot "emerge ${emerge_opts} ${pkgs}"
}
