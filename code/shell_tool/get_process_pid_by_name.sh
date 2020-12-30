#!/bin/bash
#

#根据入参pidname 获取 pid

# $# 表示给定的参数 
# $0 代表脚本执行本身
function get_process_pid_by_name
{
	if [[ $# -ne 1 ]]; then
		return 1
	else
		pids=`ps -ef | grep $1 | grep -v grep | grep -v $0 | awk '{print $2}'`
		echo "$pids"
	fi
}

get_process_pid_by_name mysql