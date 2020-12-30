#!/bin/bash
#

#根据pid 获取进程信息 入参为进程pid

function get_process_info_by_pid
{
	if [[ `ps -ef | awk -v pid=$1 '$2==pid{print }' | wc -l` -eq 1 ]]; then
		pro_status="RUNNING"
	else
		pro_status="STOPED"
	fi
	pro_cpu=`ps aux | awk -v pid=$1 '$2==pid{print $3}'`
	pro_mem=`ps aux | awk -v pid=$1 '$2==pid{print $4}'`
	pro_start_time=`ps -p $1 -o lstart | grep -v STARTED`
}