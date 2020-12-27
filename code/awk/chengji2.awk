BEGIN{
	printf "%-10s%-10s%-10s%-10s%-10s%-10s\n","Name","YuWen","Math","English","Physical","Tatol"
}
{
	tatol=$2+$3+$4+$5
	printf "%-10s%-10d%-10d%-10d%-10d%-10d\n",$1,$2,$3,$4,$5,tatol

	score_yuwen+=$2
	score_math+=$3
	score_english+=$4
	score_physical+=$5
}
END{
	printf "%-10s%-10d%-10d%-10d%-10d\n","Tatol",score_yuwen,score_math,score_english,score_physical
}
