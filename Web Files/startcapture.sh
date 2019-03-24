#!/bin/bash

date=`date '+%d-%m-%Y__%H_%M_%S'`;
tcpdump -i br0 -w $date.pcap


