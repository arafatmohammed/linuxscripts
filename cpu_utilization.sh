#!/bin/bash
# This script does not work on MacOS, it only works on Linux/Unix systems
# Author: Arafat Mohammed

# Read /proc/stat file
read cpu user nice system idle iowait irq softirq steal guest< /proc/stat

cpu_active_prev=$((user+system+nice+softirq+steal))
cpu_total_prev=$((user+system+nice+softirq+steal+idle+iowait))

# usleep 50000
sleep 5

read cpu user nice system idle iowait irq softirq steal guest< /proc/stat

cpu_active_cur=$((user+system+nice+softirq+steal))
cpu_total_cur=$((user+system+nice+softirq+steal+idle+iowait))

cpu_util=$((100*( $cpu_active_cur - $cpu_active_prev ) / ($cpu_total_cur - $cpu_total_prev) ))

echo $cpu_util
