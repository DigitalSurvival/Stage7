# $Id$

map_device_to_grub_device() {
  local device=$1

  if [ ! -f "${chroot_dir}/boot/grub/device.map" ]; then
    debug map_device_to_grub_device "device.map file doesn't exist. Creating device map now..."
    spawn_chroot "echo quit | /sbin/grub --batch --no-floppy --device-map=/boot/grub/device.map >/dev/null 2>&1" || die "Could not create Grub legacy device map."
  fi
  grep "${device}\$" ${chroot_dir}/boot/grub/device.map | awk '{ print $1; }' | sed -e 's:[()]::g'
}

#todo: Test for kernels named vmlinuz in addition to "*kernel*"
get_kernel_and_initrd() {
  local kernels=""
  
  for kernel in $(ls -1t --color=no ${kernelchroot_dir}/boot/*kernel*); do
    kernel="$(echo ${kernel} | sed -e 's:^.\+/kernel-:kernel-:')"
    if [ -e "${chroot_dir}/boot/$(echo ${kernel} | sed -e 's:kernel-:initrd-:')" ]; then
      local initrd="$(echo ${kernel} | sed -e 's:kernel-:initrd-:')"
    elif [ -e "${chroot_dir}/boot/$(echo ${kernel} | sed -e 's:kernel-:initramfs-:')" ]; then
      local initrd="$(echo ${kernel} | sed -e 's:kernel-:initramfs-:')"
    fi
    if [ -n "${kernels}" ]; then
      kernels="${kernels} ${kernel}|${initrd}"
    else
      kernels="${kernel}|${initrd}"
    fi
  done
  
  
  echo "${kernels}"
}

get_boot_and_root() {
  for mount in ${localmounts}; do
    local devnode=$(echo ${mount} | cut -d ':' -f1)
    local mountpoint=$(echo ${
	} | cut -d ':' -f3)
    if [ "${mountpoint}" = "/" ]; then
      local root="${devnode}"
    elif [ "${mountpoint}" = "/boot" -o "${mountpoint}" = "/boot/" ]; then
      local boot="${devnode}"
    fi
  done
  if [ -z "${boot}" ]; then
    local boot="${root}"
  fi
  echo "${boot}|${root}"
}

get_device_from_devnode() {
  local devnode=$1

#  echo ${devnode} | sed -e 's:\(/[a-z]\+\)[0-9]\+$:\1:' -e 's:\(/[a-z]\+[0-9]\+\)p[0-9]\+$:\1:'
  echo ${devnode} | sed -e 's:p\?[0-9]\+$::'
}

get_device_and_partition_from_devnode() {
  local devnode=$1

  echo ${devnode} | sed -e 's:p\?\([0-9]\+\)$:|\1:'
}

sanity_check_config_bootloader() {
  debug sanity_check_config_bootloader "No arch-specific bootloader configuration sanity check function."
}

local arch=$(get_arch)
if [ -f "modules/bootloader_${arch}.sh" ]; then
  debug bootloader.sh "Loading arch-specific module bootloader_${arch}.sh"
  import bootloader_${arch}
fi
