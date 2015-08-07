#!/bin/sh
#-------------------------------
# create by wangjun on 2015-07-31
# wangjuntytl@163.com
# desc:
# 	检测当前所有的screen 进程，并可以直接输入编号进入你需要的resume的screen
# 	例如：
#		0	20489.pts-115.web04
#		1	14989.pts-25.web04
#		输入你要进入的终端编号:
#       
#--------------------------------------------
usage(){
  	echo '检测当前所有的screen 进程，并可以直接输入编号进入你需要的resume的screen
	  例如：
	               0       20489.pts-115.web04
	       	       1       14989.pts-25.web04
	               输入你要进入的终端编号:'
	echo 
}
result=`screen -ls | grep 'web04' | awk '{print $1}'`
status=`screen -ls | grep 'web04' | awk '{print $2}'`
tems=($result)
status_seq=($status)
[ ${#tems[@]}"X" == "0X" ] && echo "没有可用的screen 进程" && exit 1
echo "编号    名称                     状态"
for (( i=0; i<${#tems[@]}; i++ ))
	do
		echo "$i	${tems[$i]}	${status_seq[$i]}"
	done
echo "输入你要进入的终端编号:"
read name	
screen -r ${tems[$name]}  
echo '退出	'${tems[$name]}
echo
exit 0
