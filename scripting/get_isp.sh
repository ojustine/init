#!/bin/bash
if [ -n "$1" ]
then
	IP=$1
	ISP=$(curl -s https://www.whoismyisp.org/ip/$IP | awk '/"isp"/')
	DNS=$(curl -s https://www.whoismyisp.org/ip/$IP | awk '/The hostname of the internet connection of this IP/')
	echo -n "The ISP of $IP is: "
	echo $ISP | awk -F '<|>' '/<.*>/ {print $3}'
	echo -n "The hostname of the internet connection of this IP: "
	echo $DNS | awk -F '<|>' '/<.*>/ {print $5}'
else
	echo "No params"
fi
