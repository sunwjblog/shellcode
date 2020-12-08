#!/bin/bash
#

this_pid=$$

function is_mysql_running
{
	ps -ef | grep mysql | grep -v grep | grep -v $this_pid &> /dev/null

	if [[ $? -eq 0 ]]; then
		return 0
	else
		return 1
	fi
}

is_mysql_running && echo "Mysql is running" || echo "Mysql is stoped"


#echo 方式 

function get_users
{
	users=`cat /etc/passwd | cut -d: -f1`
	ehco $users
}

user_list=`get_users`

index=1

for i in $user_list; do
	echo "The $index user is : $i"
	index=$(($index+1))
done

get_users