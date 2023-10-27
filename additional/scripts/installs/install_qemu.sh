#!/bin/bash
CLR_BLD=$(tput bold)
CLR_CLR=$(tput sgr0)
CLR_GRN=$(tput setaf 46)
echo -e "[${CLR_BLD}${CLR_GRN}grug${CLR_CLR}] installing qemu\n"
yay -S qemu ovmf edk2 libvirt ebtables dnsmasq swtpm virt-manager
sudo usermod -a -G libvirt $(whoami)
sudo usermod -a -G audio $(whoami)
sudo usermod -a -G kvm  $(whoami)
sudo systemctl start --now libvirtd.service
sudo systemctl enable libvirtd.service
sudo systemctl enable virtlogd.service
sudo systemctl start --now virtlogd.service
sudo virsh net-autostart default
sudo virsh net-start default

