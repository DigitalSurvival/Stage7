###ToDo###

- [x] ~~Write a package building script to auto-generate new releases.~~
  1. ~~Implement Stage7 package script with super tight compression for minimal bandwidth consumption and maximum fun (xz).~~ *Done!*
- [x] ~~Write a "getStage7" script to pull down Stage7 package files from the web and completely configure the project.~~ *Done!*
- [ ] Write end user instructions and documentation.
  1. ~~Update the project's README page with accurate "how to get" and "how to use" information.~~
  2. Keep the example configuration files tidy after adding new features.
  3. Search the configuration options file in /docs folder for #todo stuff.
  4. Generate a PDF of available configuration options in a pretty format (user manual).
  5. ~~Generate a dependencies list in /docs for GitHub viewers.~~
- [ ] Modernize the Stage7 base
  1. Add GPT and EFI support.
  2. Add GRUB2 support. *in progress*
  3. Add Linux Loader (Lilo) support.
  4. Add Systemd support (Do not expect this for a while...)
  5. Add Parted support.
  6. Add btrfs file system, btrfs RAID, and SSD hard drive support.
  7. Add hardened and vanilla kernel support.
  8. Verify both x86 and AMD64 architectures are operational.
  9. Add predictable network interface names support.
  10. ~~Add hostname support to profiles.~~ *Done!*
  11. ~~Add a utilities and tool check to be sure important components are not missing from the system.~~
  12. Create stage 4 backup option (-b|--backup)
  13. Make the usage options more modular; let the user specify more than one option at a time.
- [ ] Add extended functionality to Stage7.
  1. Add automatic X server install support as a Stage7 profile.
  2. Add automatic OpenBox install/configure support as a Stage7 profile.
    - [ ] Include themes support for OpenBox.
	- [ ] Include power management support.
  3. Start Digital Survival server platform functionality after Stage7 desktop functionality is complete.
  4. Create Stage7 recovery disk from which to install or capture an image/disk.
  5. Add stage 4 rescue support to a Linux recovery disk (yet to be named).
- [ ] Digital Survival integration
  1. Add overlay support (via new Portage repo.conf stuff).
  2. Implement Gentoo's webapp-config program for web applications such as Owncloud, Wordpress, MediaWiki, ChurchTools, etc.
- [ ] Create ncurses install menu for non-GUI terminals
  1. Research the creation of ncurses interfaces. *Started...*
- [ ] Create X server install menu for anything X server dependent
  1. ~~Research the options on X server interfaces. Find something with minimal dependencies.~~ *Done!*
- [ ] Make importing of pre-configured scripts easy for end users.
  1. Integrate into ncurses menu and/or X server menu.
- [ ] Possible features to implement after the base gets established.
  1. Dual boot support (using os-prober). Mainly for dual booting with Windows XP, Vista, 7, 8, 8.1, 10, etc.
  2. Add laptop/notebook configuration option with support for power saving.
  3. Add ARM microprocessor architecture support.
  4. Add support for a Steam Machine profile to profile's list. This would definitely be a step beyond doing a simple OpenBox configuration.
  5. Add support for a HTTP interface for remote installs. This would eventually replace the need for a Python GUI. It would display the LAN IP in a web browser so the user could write it down and connect from another PC on the LAN. It would be ground breaking to create a live medium (USB, CD, DVD) that would handle all this.

