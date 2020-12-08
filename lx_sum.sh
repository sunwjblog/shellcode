#!/bin/bash
#

while [[ true ]]; do

	read -p "pls input a positive number: " num 
	#整数与整数相加 $?=0 不成立直接回收
	expr $num + 1 &> /dev/null
	# num是整数
	if [[ $? -eq 0 ]]; then
		# num是整数大于0 成立
		if [[ `expr $num \> 0` -eq 1 ]]; then
			# 循环
			for (( i = 0; i <= $num; i++ )); do
				sum=`expr $sum + $i`
			done
			echo "1+2+3+......+$num = $sum"
			exit
		fi
	fi
	echo "error,input enlogal"
	continue
done
