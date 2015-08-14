#!/bin/sh
#-------------------------------
# create by wangjun on 2015-07-31
# wangjuntytl@163.com
# desc:
#       快速执行设定的命令，可以直接输入编号进入
#       例如：
#               0       ssh node01
#               1       ssh node02
#               输入你要进入的终端编号:
#
#--------------------------------------------
usage(){
        echo '快速执行设定的命令，可以直接输入编号进入
          例如：
                       0       ssh node01
                       1       ssh node02
                       输入你要进入的终端编号:'
        echo
}
cd `dirname $0`
[ ! -f "./.cmd.list" ] && echo "./cmd.list 文件不存在,请先在同级目录下创建cmd.list文件" && exit 1
CMD_LIST=`cat ./.cmd.list`
echo "${CMD_LIST}" | awk  'BEGIN{print "编号\t命令"}{print NR"\t"$0}END{}'
echo
echo "输入你要进入的命令编号:"
read name
cmd=`echo  "${CMD_LIST}" | awk  'NR=="'${name}'" {print$0}'`
echo $cmd
$cmd
echo '退出      '$cmd
echo
exit 0