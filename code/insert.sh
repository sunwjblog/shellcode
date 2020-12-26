#!/bin/bash
#

function create_random()
{
	min=$1
	max=$(($2-$min+1))
	num=$(date +$s%N)
	echo $(($num%$max+$min))
}

INDEX=1

while [[ true ]]; do
	for user in Allen Mike Jerry Tracy Hanmeimei Lilei; do
		COUNT=$RANDOM
		NUM1=`create_random 1 $COUNT`
		NUM2=`expr $COUNT - $NUM1`
		echo "`date '+%Y-%m-%d %H:%M:%s'` $INDEX Batches: user $user INSERT $COUNT DATA INTO database.table 'test', Insert $NUM1 Record Successful,Fail Insert $NUM2 Records" >> ./db.log.20201226
		INDEX=`expr $INDEX + 1`
	done
done