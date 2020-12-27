BEGIN{
	printf "%-10s%-10s\n","User","Total Records"
}

{
	USER[$6]+=$8
}
END{
	 for(u in USER)
		printf "%-10s%-10d\n",u,USER[u]
}
