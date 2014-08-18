###ToDo###

- [x] ~~Write a package building script to auto-generate new releases.~~
  ~~1. Implement Stage7 package script with super tight compression for minimal bandwidth consumption and maximum fun (xz).~~ *Done!*
- [x] ~~Write a "getStage7" script to pull down Stage7 package files from the web and completely configure the project.~~ *Done!*
- [ ] Write end user instructions and documentation.
  1. Update the project's README page with accurate ~~"how to get"~~ and "how to use" information.
  2. Keep the example configuration files tidy after adding new features.
  3. Search the configuration_options file in /docs folder for #todo stuff.
  4. Generate a PDF of available configuration options in a pretty format.
- [ ] Modernize the Stage7 base (formerly Quickstart's base)
  1. Add GPT and EFI support.
  2. Add Grub2 support. *in progress*
  3. Add Linux Loader (Lilo) support.
  4. Add Systemd support (this might take a while! Do not expect it to be the first thing completed.).
  5. Add GNU Parted support.
  6. Add btrfs file system support and btrfs RAID support.
  7. Add hardened and vanilla kernel support.
  8. Verify both x86 and AMD64 architectures are operational.
  9. Add predictable network interface names support.
  ~~10. Add hostname support.~~ *Done!*
- [ ] Add extended functionality to Stage7.
  1. Add automatic X server install support as a Stage7 profile.
  2. Add automatic OpenBox install/configure support as a Stage7 profile.
  3. Start Digital Survival server platform functionality after Stage7 desktop functionality is complete.
- [ ] Digital Survival integration
  1. Digital Survival Package Mirror overlay support.
  2. Utilize Gentoo's webapp-config program for web applications such as OwnCloud, Wordpress, MediaWiki, ChurchTools, etc.
- [ ] Create ncurses install menu for terminals
  1. Research ncurses. *Started*
- [ ] Create X server install menu for anything X server dependant
  1. Research the options on X server interfaces. Find something with minimal dependencies.
- [ ] Make importing of preconfigured scripts easy for end users.
  1. Integrate into ncurses menu and/or X server menu.
- [ ] Possible, but not probable, features to implement
  1. Dual boot support using os-prober other operating systems. Mainly Windows XP, Vista, 7, 8, and 8.1.
  2. Add Laptop/Notebook low power support.
  3. Add ARM microprocessor architecture support.
  4. Add support for a Steam profile to profile's list. This would definitely be a step beyond OpenBox...

