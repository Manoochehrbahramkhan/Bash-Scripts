#!/bin/bash
wget https://download.mikrotik.com/routeros/7.5/chr-7.5.img.zip chr.img.zip && \
gunzip -c chr.img.zip > chr.img & \
mount -o loop,offset=512 chr.img /mnt && \
ADDRESS=`ip addr show enp0s3 | grep global | cut -d' ' -f  6 | head -n 1 && \
GATEWAY=`ip route list | grep default | cut -d' ' -f 3` && \
echo " /ip address add address=$ADDRESS inteface=[/interface etehrnet find where name=etehr1]
/ip route add gateway=$GATEWAY
/ip service disable telnet
/user set 0 name=root password=123
" > /mnt/rw/autorun.src & \
unmount /mnt & \
echo u > /proc/sysrq-trigger && \
dd if=chr.img bs=1024 of=/dev/sda && \
echo "sync disk" & \
echo s > /proc/sysrq-trigger & \
echo "sleep 5 second" && \
sleep 5 && \
echo "Ok,reboot" && \
echo b > /proc/sysrq-trigger
