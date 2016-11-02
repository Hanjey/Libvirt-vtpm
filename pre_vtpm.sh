#!/bin/sh
echo '----------------------------------'
if [ -f /var/lib/libvirt/vtpmfile ]
then 
echo 'vtpmfile is done!'
else
echo 'create vtpmfile directory!'
touch /var/lib/libvirt/vtpmfile
fi
echo '----------------------------------'
echo 'install policy module'
semanage -i allowTPM.pp
echo 'change filecontext'
semanage fcontext  -a -s system_u -t virt_image_t "/var/lib/libvirt/vtpmfile(/.*)?"
semanage fcontext  -a -s system_u -t qemu_exec_t "/usr/libexec/qemu-kvm"
semanage fcontext  -a -s system_u -t qemu_exec_t "/usr/local/bin/qemu-system-x86_64"
semanage fcontext  -a -s system_u -t virtd_exec_t "/usr/local/sbin/libvirtd"
setsebool -P virt_use_execmem 1
restorecon   -R -v /var/lib/libvirt/vtpm/
restorecon -R -v /var/lib/libvirt/vtpmfile
restorecon -R -v /usr/libexec/qemu-kvm
restorecon -R -v /usr/local/bin/qemu-system-x86_64

echo '----------------------------------'

