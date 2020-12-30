#!/bin/bash
#
#操作db2数据库查询


string="请输入你需要查询的充值业务数据"

function print_tips
{
		echo "**********************************"
		echo "(1) 查询支付中心订单表 PAYUSER.T_PAY_PAYCENTER_yyyymm"
		echo "(2) 查询普通充值订单表 webuser.tf_payment_orders"
		echo "(3) 查询营销案充值订单表 webuser.tf_paymarket_orders"
		echo "(4) 查询10086订单表 webuser.TF_PAYMENT_ORDERS_10086"
		echo "(5) 查询折扣券订单记录表 webuser.TF_PAYMENT_ECOUPON_ORDERS"
		echo "**********************************"
}

function print_query_t_pay_paycenter_tips
{
		echo "**********************************"
		echo "(1) 根据支付流水号查询 AGENT_ORDER_NO"
		echo "(2) 根据渠道订单号查询 CHANNEL_ORDER_NO"
		echo "(3) 退出"
		echo "**********************************"
}

function print_query_tips
{
		echo "**********************************"
		echo "(1) 根据手机号查询 MOBILE"
		echo "(2) 根据渠道订单号查询 CHANNEL_ORDER_NO"
		echo "(3) 退出"
		echo "**********************************"
}


function query_t_pay_paycenter
{
	echo
	read -p "Please input your query date: " date_time
	print_query_t_pay_paycenter_tips
	read -p "Please input your choice(1|2|3)：" choice1
	case $choice1 in
		1 )
			read -p "Please input AGENT_ORDER_NO: " AGENT_ORDER_NO
			db2 "select * from PAYUSER.T_PAY_PAYCENTER_$date_time where AGENT_ORDER_NO='$AGENT_ORDER_NO'"
			;;
		2 )
			read -p "Please input CHANNEL_ORDER_NO: " CHANNEL_ORDER_NO
			db2 "select * from PAYUSER.T_PAY_PAYCENTER_$date where CHANNEL_ORDER_NO='$CHANNEL_ORDER_NO'"
			;;
	esac
	
}


function query_tf_payment_orders
{
	echo
	print_query_tips
	read -p "Please input your choice(1|2|3)：" choice1
	case $choice1 in
		1 )
			read -p "Please input mobile: " mobile
			db2 "select * from webuser.tf_payment_orders where mobile='$mobile' order by ORDERTIME desc fetch first 1 rows only"
			;;
		2 )
			read -p "Please input ORDER_ID: " ORDER_ID
			db2 "select * from webuser.tf_payment_orders where ORDER_ID='$ORDER_ID'"
			;;
	esac
	
}

function query_tf_paymarket_orders
{
	echo
	print_query_tips
	read -p "Please input your choice(1|2|3)：" choice1
	case $choice1 in
		1 )
			read -p "Please input mobile: " mobile
			db2 "select * from webuser.tf_paymarket_orders where mobile='$mobile' order by ORDERTIME desc fetch first 1 rows only"
			;;
		2 )
			read -p "Please input ORDER_ID: " ORDER_ID
			db2 "select * from webuser.tf_paymarket_orders where ORDER_ID='$ORDER_ID'"
			;;
		3 )
			exit
			;;
		* )
			echo "Eorr ,input only in (1|2|3)"
			;;
	esac
	
}

function query_tf_payment_orders_10086
{
	echo
	print_query_tips
	read -p "Please input your choice(1|2|3)：" choice1
	case $choice1 in
		1 )
			read -p "Please input mobile: " mobile
			db2 "select * from webuser.TF_PAYMENT_ORDERS_10086 where mobile='$mobile' order by ORDERTIME desc fetch first 1 rows only"
			;;
		2 )
			read -p "Please input ORDER_ID: " ORDER_ID
			db2 "select * from webuser.TF_PAYMENT_ORDERS_10086 where ORDER_ID='$ORDER_ID'"
			;;
		3 )
			exit
			;;
		* )
			echo "Eorr ,input only in (1|2|3)"
			;;
	esac
	
}

function query_tf_payment_ecoupon_orders
{
	echo
	print_query_tips
	read -p "Please input your choice(1|2)：" choice1
	case $choice1 in
		1 )
			read -p "Please input mobile: " mobile
			db2 "select * from webuser.TF_PAYMENT_ECOUPON_ORDERS where mobile='$mobile'"
			;;
		2 )
			read -p "Please input ORDER_ID: " ORDER_ID
			db2 "select * from webuser.TF_PAYMENT_ECOUPON_ORDERS where ORDER_ID='$ORDER_ID'"
			;;
	esac
	
}

db2 connect to ord

while [[ true ]]; do
	echo "[string=$string]"
	echo
	print_tips
	read -p "Please input your choice(1|2|3|4|q|Q)：" choice
	case $choice in
		1 )
			query_t_pay_paycenter
			;;
		2 )
			query_tf_payment_orders
			;;
		3 )
			query_tf_paymarket_orders
			;;
		4 )
			query_tf_payment_orders_10086
			;;
		5 )
			query_tf_payment_ecoupon_orders
			;;
		q|Q )
			exit
			;;
		* )
			echo "Eorr ,input only in (1|2|3|4|5|q|Q)"
			;;
	esac
done
