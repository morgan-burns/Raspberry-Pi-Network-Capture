#!/bin/bash
# This is the initial file to set up the Raspberry Pi Network Packet Capture by Morgan Burns

# Make sure that the system is up to date
echo ("$0: Updating System...")
sudo apt-get install update
echo ("$0: System up to date.")

# Installing prerequisites
echo ("$0: Installing Prerequisite Software...")
sudo apt-get install bridge-utils
echo ("$0: Software Installed.")

# Setting up the bridge between the two network cards. 

echo "$0: Setting eth0-eth1 Bridge"

## Shutdown both interfaces first
sudo ifconfig eth0 down
sudo ifconfig eth1 down

# Set interfaces to promiscuous mode
sudo ifconfig eth0 0.0.0.0 promisc up
sudo ifconfig eth1 0.0.0.0 promisc up

# Add both interfaces to virtual bridge network
sudo brctl addbr br0
sudo brctl addif br0 eth0
sudo brctl addif br0 eth1

## Configure an IP to the bridge to allow remote access
sudo ifconfig br0 192.168.10.254 netmask 255.255.255.0 up
sudo route add default gw 192.168.10.1 dev br0

# Add bridge.sh to /etc/rc.local
echo "bash /var/www/html/bridge.sh" >> /etc/rc.local

echo "$0: Done Bridge!"

# Ensure that Apache and PHP is installed
echo ("$0: Installing Apache and PHP...")
sudo apt-get -y install apache2 libapache2-mod-php
echo ("$0: Apache and PHP successfully installed.")

# Now we need to move the files into the web directory. 
echo ("$0: Moving web files...")
sudo mv -R /Web_Files/* /var/www/html
echo ("$0: Web files moved successfully")

# Now we need to give the current user (pi) permission to use TCPDump
echo ("$0: Configuring TCPDump permissions...")
sudo groupadd pcap
sudo usermod -a -G pcap pi
sudo chgrp pcap /usr/sbin/tcpdump
sudo chmod 750 /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
echo ("$0: TCP Dump permissions configured.")



# Done
echo ("$0: Setup complete, please visit your PI's IP")