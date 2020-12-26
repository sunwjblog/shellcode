BEGIN{
	printf "%-10s%-20s%-20s%-20s\n","User","Tatol","Success","Failed"
}
{
	TATOL[$6]+=$8
	SUCCESS[$6]+=$14
	FALL[$6]+=$18
}
END{
	for(u in SUCCESS)
	{
		sum_tatol+=TATOL[u]
		sum_success+=SUCCESS[u]
		sum_fall+=FALL[u]
		printf "%-10s%-20d%-20d%-20d\n",u,TATOL[u],SUCCESS[u],FALL[u]
	}
	printf "%-10s%-20d%-20d%-20d\n","Tatol",sum_tatol,sum_success,sum_fall
}
