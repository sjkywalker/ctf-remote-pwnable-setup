#!/bin/bash

# Copyright © 2018 James Sung. All rights reserved.

if [[ $EUID != 0 ]]; then
	echo "Please run as root"
	exit 1
fi

if [[ $# != 2 ]]; then
	echo "Usage : reloadprob <problemname> <port>"
	echo "Sample: reloadprob start 9999"
	exit 1
fi

touch /etc/xinetd.d/$1
FILE2="/etc/xinetd.d/$1"
/bin/cat <<EOF >$FILE2
service $1
{
	disable = no
	socket_type = stream
	protocol = tcp
	wait = no
	user = $1
	bind = 0.0.0.0
	server = /home/$1/$1
	type = UNLISTED
	port = $2
}

EOF

service xinetd restart
