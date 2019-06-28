# Raspberry-Pi-Network-Capture
This repository is a few sh files along with PHP and bash that will allow you to take a .pcap network monitor from the ease of a raspberry pi. 

Download all of the files and unzip into your documents
- Make the setup file executable (chmod +x setup.sh)
- Run the setup file (./setup.sh)

The setup file will download and install all required prerequisits for this software to run, it includes:
- TCP Dump
- Apache and PHP
- Directory Lister

You will need to edit the network properties in the setup.sh file so that the packet tracer will work with your network. 
You will need to edit lines 32 and 33. For example my office network runs on the 192.168.5.x range. Most home networks will either run on the 192.168.0.x or 192.168.1.x range. 

You can find your network range by opening a command prompt (or Terminal on Mac) and typing the ipconfig (ifconfig on mac and linux). Your IPv4 address is the address that you need to pay attention to.
