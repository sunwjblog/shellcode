#!/bin/bash
#

user="root"
passwd="1992Sunwj@"
db_name="$1"

SQL="$2"

mysql -u"$user" -p"$passwd"  -D "$db_name" -B -e "$SQL"
