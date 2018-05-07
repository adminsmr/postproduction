#!/bin/sh
# go2net.sh
#
# Created by FreeZza on (06.04.15) correct v.0.1
#
#set port name
SPN=`networksetup -listallhardwareports|grep -A2 -i wi-fi|grep -i device|awk '{print $2;}'`

#check first parametr
CON1=`networksetup -getairportpower "$SPN"|awk '{print $4}'`

#start script
if [ "$CON1" == Off ]; then
	sudo networksetup -setnetworkserviceenabled "Wi-Fi" on
	read -rst 3
	sudo networksetup -setairportpower $SPN on
	sudo networksetup -setnetworkserviceenabled "Wi-Fi" on
	sudo networksetup -setdnsservers "Wi-Fi" <IP_DNS_SERVER>
	sudo networksetup -setsearchdomains "Wi-Fi" "<FQDN>"
	#wait for 3 sec pause ot airpower on
	read -rst 3
	sudo networksetup -setairportnetwork $SPN "<NET_NAME>" "<PASS>"
else
	sudo networksetup -setsearchdomains "Wi-Fi" empty
	sudo networksetup -setdnsservers "Wi-Fi" empty
	sudo networksetup -removeallpreferredwirelessnetworks $SPN
	sudo networksetup -setnetworkserviceenabled "Wi-Fi" off
	sudo networksetup -setairportpower $SPN off
	read -rst 3
	sudo networksetup -setnetworkserviceenabled "Wi-Fi" off
fi
