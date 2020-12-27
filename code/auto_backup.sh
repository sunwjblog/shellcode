#!/bin/bash
#

db_user="root"
db_passwd="1992Sunwj@"

ftp_user="sunwj"
ftp_passwd="sunwj"
ftp_host="192.168.184.3"


dst_dir="/tmp/sunwj"
time_date="`data +%Y%m%d%H%M%S`"
file_name="school_score_${time_date}.sql"

function auto_ftp
{
	ftp -niv << EOF
		open $ftp_host
		user $ftp_user $ftp_passwd
		
		cd $dst_dir
		put $1
		bye
EOF 
}

mysqldump -u$db_user -pdb_passwd school score > ./$file_name && atuo_ftp ./$file_name 

