#!/bin/bash
#

ftp -inv << EOF 
	open 192.168.184.3
	user sunwj sunwj

	cd /tmp
	put 123
	bye
EOF
