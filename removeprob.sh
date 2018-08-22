#!/bin/bash

# Copyright © 2018 James Sung. All rights reserved.

if [[ $EUID != 0 ]]; then
	echo "Please run as root"
	exit 1
fi

if [[ $# != 2 ]]; then
	echo "Usage : removeprob <problemname> <port>"
	echo "Sample: removeprob start 9999"
	exit 1
fi

userdel -r $1
rm -rf /home/$1

rm /etc/xinetd.d/$1

service xinetd restart
