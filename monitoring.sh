#!/bin/bash

# ARCH
arch=$(uname -a)

# CPU PHYSICAL
cpup=$(cat /proc/cpuinfo | grep "physical id"|wc -l)

# CPU VIRTUAL
cpuv=$(cat /proc/cpuinfo | grep "processor"|wc -l)

# RAM
ram_total=$(free --mega | grep "Mem"| awk '{print $2}')
ram_used=$(free --mega | grep "Mem"|awk '{print $3}')
ram_percent=$(free | grep "Mem"| awk '{printf("%.2f"), $3/$2*100}')

# DISK
disk_total=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_t += $2} END {printf ("%.1fGb\n"), disk_t/1024}')
disk_used=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_u += $3} END {print disk_u}')
disk_percent=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_u += $3} {disk_t+= $2} END {printf("%d"), disk_u/disk_t*100}')

# CPU LOAD
cpu_loaded=$(top -bn1|grep "%Cpu"|awk '{printf("%.1f%%"),$2+$4}')

# LAST BOOT
lb=$(who -b | awk '{print $3 " " $4}')
minb=$(who -b | awk  -F ":" '{print ($2%10)*60}')

# LVM USE
lvmu=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

# TCP CONNEXIONS
tcpc=$(ss -ta | grep ESTAB | wc -l)

# USER LOG
ulog=$(users | wc -w)

# NETWORK
ip=$(hostname -I)
mac=$(ip link | grep "link/ether" | awk '{print $2}')

# SUDO
cmnd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

sleep $minb && wall "  Architecture: $arch
        CPU physical: $cpup
        vCPU: $cpuv
        Memory Usage: $ram_used/${ram_total}MB ($ram_percent%)
        Disk Usage: $disk_used/${disk_total} ($disk_percent%)
        CPU load: $cpu_loaded
        Last boot: $lb
        LVM use: $lvmu
        Connections TCP: $tcpc ESTABLISHED
        User log: $ulog
        Network: IP $ip ($mac)
        Sudo: $cmnd cmd"
