=== Version 0.1.1-alpha ===
Modified the output of the -V|--version option (and added the -V for verbose option). Verbose now prints a more standardized open source output. This could be tweaked again in the future, but should remain in a similar format.
Added a check for missing modules. Installer will now exit if a default (or a defined custom) module is missing. This protects Stage7 against any potential inconsistencies that come from missing modules.
Added a "modules_import" feature to install profiles which will allow the user to specify custom modules in profiles. This enables Stage7 to only look for utilities that are relevant to the modules the profile uses (see below).
Added a dependencies check for essential system utilities (tar, ifconfig, mkfs.btrfs, etc). Changing the modules imported will provide different results (i.e. not all utilities Stage7 _might_ use are needed for simply generating a stage 4 backup).  An error message will print after finding missing executable dependencies.
Added rsync support to fetcher. Now it is possible to fetch stage tarballs via rsync.
Changed some "echo -e" statements to "printf" stagements to avoid bashisms in attempt maintain POSIX compliance.

Things to look out for in the next release:
Started working on adding support for (GNU) Parted. Changed partition configuration option to "fpart" to specify calling fdisk.
Started work on adding NTFS and VFAT support. FAT is needed for EFI partitions. NTFS would be a nice option to have to share a partition with Windows compatibility.
Started work on rescue.sh module. This will (eventually) be used to create stage4 snapshots of a system which can be restored via the stage4 install mode.
Made minor capitalization corrections to the bootloader scripts.
Made small modifications to install_profile examples.

=== Version 0.1.0-alpha ===

This is an alpha release. The software is not very usable at this point. We're still in the planning phase!