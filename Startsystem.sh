#!/bin/bash

#关闭防火墙
echo Start to turn off the firewall.
systemctl stop firewalld
systemctl disable firewalld
echo firewall is dead.

#关闭selinux
echo Start to turn off the selinux.
sed -i 's/=enforcing/=disabled/' /etc/selinux/config
setenforce 0
echo Selinux is off.

#关闭swap
echo Start to turn off swap.
swapoff -a
sed -i 's/^[^#].*swap*/#&/g' /etc/fstab
echo Swap is off.
