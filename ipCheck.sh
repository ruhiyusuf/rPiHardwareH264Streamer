#!/bin/bash

echo "Checking for connection"
CLIENT_IP=`netcat -lu -w0 5803` 
echo $CLIENT_IP

ONLINE=1
while [ 1 ]
do
	# STATUS_CURRENT=$(nmcli -t -f STATE nm status)
	STATUS_CURRENT=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo connected || `pidof raspivid | xargs kill`)
	if $STATUS_CURRENT == "connected" 
	then
		echo "connected"
	elif $STATUS_CURRENT == "disconnected"
	then 
		pidof raspivid | xargs kill
		echo "cant see network"
	fi

	sleep 2
done
