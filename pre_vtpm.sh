#!/bin/sh
echo '----------------------------------'
echo 'create VTPM store file'
mkdir /var/lib/libvirt/vtpm
echo '----------------------------------'
echo 'change filecontext'
semanage fcontext  -m -s system_u -t virt_image_t "/var/lib/libvirt/vtpm(/.*)?"
restorecon   -R -v /var/lib/libvirt/vtpm/
echo '----------------------------------'

