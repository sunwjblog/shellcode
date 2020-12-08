#!/bin/bash
#

wechat_process_num=$(ps -ef | grep WeChat | grep -v grep | wc -l)

if [[ $wechat_process_num -eq 0 ]]; then
	echo "systemctl start WeChat"
fi