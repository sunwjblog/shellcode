#!/bin/bash
#

user="root"
passwd="1992Sunwj@"

mysql_conn="mysql -u"$user" -p"$passwd""

cat data.txt | while read id name birth sex
do
	if [ $id -gt 1014 ];then
		$mysql_conn -e "insert into school.student1 values('$id','$name','$birth','$sex')"
	fi
done
