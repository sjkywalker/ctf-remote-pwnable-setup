#!/bin/bash

# Copyright © 2018 James Sung. All rights reserved.

if [[ $EUID != 0 ]]; then
	echo "Please run as root"
	exit 1
fi

if [[ $# != 2 ]]; then
	echo "Usage : makeprob <problemname> <port>"
	echo "Sample: makeprob start 9999"
	exit
fi

adduser $1

touch /home/$1/$1
chmod +x /home/$1/$1
chown -R root:$1 /home/$1
chmod 750 /home/$1

touch /home/$1/flag
echo "flag_{$1}" > /home/$1/flag
chown root:$1 /home/$1/flag
chmod 440 /home/$1/flag

touch /home/$1/.profile
echo "cd /home/$1" > .profile

FILE1="/home/$1/$1"
/bin/cat <<EOF >$FILE1
#!/bin/bash

echo "Hi, <$1> is running on port $2"

EOF

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
