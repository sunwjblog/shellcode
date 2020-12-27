#!/bin/bash
#
this_pid=$$

#this_pid 将自身脚本进程过滤
while [[ true ]]; do
	ps -ef | grep mysql | grep -v grep | grep -v $this_pid &> /dev/null

	if [[ $? -eq 0 ]]; then
		echo "Myql is running well"
		sleep 3
	else
		echo "Mysql is down,Start it ...."
		mysql.server start
	fi

done
