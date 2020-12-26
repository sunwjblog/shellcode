BEGIN{
	printf "%-10s%-10s%-10s%-10s%-10s%-10s\n","Name","Chinese","English","Math","Physical","Average"
}

{
	total=$2+$3+$4+$5
	avg=total/4
	if(avg>90)
	{
		 printf "%-10s%-10d%-10d%-10d%-10d%-0.2f\n",$1,$2,$3,$4,$5,avg
	}
}
