BEGIN{
	printf "%-10s%-20s%-20s\n","User","Success_Records","Failed_Records"
}
{
	SUCCESS[$6]+=$14
	FALL[$6]+=$18
}
END{
	for(u in SUCCESS)
		printf "%-10s%-20d%-20d\n",u,SUCCESS[u],FALL[u]
}
