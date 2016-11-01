#!/bin/sh
./configure --with-xen=no --with-xen-inotify=no --with-uml=no --with-openvz=no --with-vmware=no --with-phyp=no --with-xenapi=no --with-libxl=no --with-vbox=[PFX]=no --with-lxc=no --with-esx=no --with-hyperv=no --with-vz=no --with-qemu=yes
make
make install
