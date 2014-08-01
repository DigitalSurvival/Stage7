# $Id$

run_emerge() {
  pkgs=$1

  debug emerge "Packages are '${pkgs}'"
  spawn_chroot "emerge ${emerge_opts} ${pkgs}"
}
