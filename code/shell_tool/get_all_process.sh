#!/bin/bash
#

#获取所有进程名

HOME_DIR="/Users/sunwj/Documents/dev/shellcode/code/shell_tool"
CONFIG_FILE="process.cfg"

function get_all_group
{
	# ^$ 代表空行
	G_LIST=`sed -n '/\[GROUP_LIST\]/,/\[.*\]/p' $HOME_DIR/$CONFIG_FILE | egrep -v "(^$|\[.*\])"`
	echo "$G_LIST"
}

function get_all_process1
{
	for g in `get_all_group`; do
		P_LIST=`sed -n "/\[$g\]/,/\[.*\]/p" $HOME_DIR/$CONFIG_FILE | egrep -v "(^$|\[.*\])"`
		echo "$P_LIST"
	done
}
