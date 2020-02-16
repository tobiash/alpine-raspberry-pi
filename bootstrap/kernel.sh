#!/bin/sh

set -xe

echo "dwc_otg.lpm_enable=0 console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory" > /boot/cmdline.txt

cat <<EOF > /boot/config.txt
disable_splash=1
boot_delay=0
arm_64bit=1
EOF

# fstab
cat <<EOF > /etc/fstab
/dev/mmcblk0p1  /media/mmcblk0p1           vfat    defaults          0       2
/media/mmcblk01p1  /boot        none defaults, bind 0   0
/dev/mmcblk0p2  /               ext4    defaults,noatime  0       1
EOF
