#!/bin/bash

FILE_NAME=~/Destop/my.cnf

function get_all_segment
{
	echo "`sed -n '/\[.*\]/p' $FILE_NAME | sed -e 's/\[//g' -e 's/\]//g'`"
}

function count_iterms_in_segment
{

	iterms = `sed -n '/\['$1'\]/,/\[.*\]/p' $FILE_NAME | grep -v "^#" | grep -v "^$" | grep -v "\[.*\]"`

	index=0

	for iterm in $iterms; do
		index=`expr $index + 1`
	done

	echo $index
}

number=0

for segment in `get_all_segment`; do
	
	number=`expr $number + 1`
	iterms_count=`count_iterms_in_segment $segment`

	echo "$number : $segment  $iterms_count"
done