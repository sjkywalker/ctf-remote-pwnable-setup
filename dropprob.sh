#!/bin/bash

# Copyright © 2018 James Sung. All rights reserved.

if [[ $EUID != 0 ]]; then
	echo "Please run as root"
	exit 1
fi

if [[ $# != 2 ]]; then
	echo "Usage : dropprob <problemname> <port>"
	echo "Sample: dropprob start 9999"
	exit
fi

rm /etc/xinetd.d/$1

service xinetd restart
