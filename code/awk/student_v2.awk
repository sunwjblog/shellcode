BEGIN{
	printf "%-10s%-10s%-10s%-10s%-10s%-10s\n","Name","Chinese","English","Math","Physical","Average"
}

{
	total=$2+$3+$4+$5
	avg=total/4
	if(avg>0)
	{
		 printf "%-10s%-10d%-10d%-10d%-10d%-0.2f\n",$1,$2,$3,$4,$5,avg
	}

	score_chinese+=$2
	score_math+=$3
	score_enligh+=$4
	score_phyiscal+=$5
	score_avg+=avg
}
END{
	printf "%-10s%-10d%-10d%-10d%-10d%-0.2f\n","total",score_chinese,score_math,score_enligh,score_phyiscal,score_avg
}
