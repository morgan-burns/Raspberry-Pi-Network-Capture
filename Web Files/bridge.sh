#!/usr/bin/env bash

# Set up transparent bridge eth1-eth0
# -eth0 (built in): attach directly to router (outside)
# -etho (USB Adapter) : attach to switch or device (inside)
#
# This should be executed on system startup
# Add the following to this file: /etc/rc.local:
#	bash /path/to/file

# This requires the following
#	apt-get install bridge-utils

echo "$0: Setting eth0-eth1 Bridge"

## Shutdown both interfaces first
ifconfig eth0 down
ifconfig eth1 down

# Set interfaces to promiscuous mode
ifconfig eth0 0.0.0.0 promisc up
ifconfig eth1 0.0.0.0 promisc up

# Add both interfaces to virtual bridge network
brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1

## Configure an IP to the bridge to allow remote access
ifconfig br0 192.168.10.254 netmask 255.255.255.0 up
route add default gw 192.168.10.1 dev br0

echo "$0: Done Bridge!"
