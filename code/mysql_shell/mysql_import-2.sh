#!/bin/bash
#

user="root"
passwd="1992Sunwj@"

#mysql_conn="mysql -u"$user" -p"$passwd""

#shell 内置的环境变量，input file Separate 处理默认分隔符
IFS="|"

cat data-2.txt | while read id name birth sex
do
	if [ $id -gt 1014 ];then
		mysql -u"$user" -p"$passwd" -e "insert into school.student2 values('$id','$name','$birth','$sex')"
	fi
done
