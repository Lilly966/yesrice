#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "Relaunching with sudo."
	exec sudo "$0" "$@"
fi

function install_script_nvidia() {
	pkgs="nvidia nvidia_modeset nvidia_uvm nvidia_drm"
	sed -i "s/MODULES=()/MODULES=($pkgs)/" /etc/mkinitcpio.conf
	yay -S linux-headers nvidia-dkms qt5-wayland qt5ct libva libva-nvidia-driver-git --noconfirm
	sudo mkinitcpio --config /etc/mkinitcpio.conf --generate /boot/initramfs-custom.img
	echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia.conf

	echo "Grug is done, grug requires you to reboot.\n"
}

install_script_nvidia
