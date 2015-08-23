#!/usr/bin/env bash
#-------------------------------------
# create by wangjun on 2015-08-11
# wangjuntytl@163.com
#
# desc
#	useful date utils
# note
#   the util can't use in mac
#-------------------------------------

SIMPLE_FORMAT='+%Y-%m-%d'
NORMAL_FORMAT='+%Y-%m-%d %H:%M:%S'

os(){
	_os='linux'
	case "`uname`" in
      		CYGWIN*) cygwin=true ;;
      		MINGW*) mingw=true;;
      		Darwin*) _os='mac'
	esac
	echo $_os
}


current_timestamp(){
  date '+%s'
}

current_time(){
  _n=$1
  [ "${_n}"'X' == 'X' ] && _n='+%H:%M:%S'
  date ${_n}
}

#current_time

# current_timestamp

current_datetime(){
  date "${NORMAL_FORMAT}"
}

# current_datetime

current_date(){
    date '+%Y-%m-%d'
}

# current_date

datetime_before(){
    _n=$1
    [ $_n'X' == 'X' ] && _n=+0
    if [ `os` == "linux" ];then
        date '+%Y-%m-%d %H:%M:%S' -d "${_n} days"
    else
#        date -v -7d +%Y-%m-%d
        date -v ${_n}d  "${NORMAL_FORMAT}"
    fi
}

# datetime_before +1
# datetime_before
# datetime_before -1

date_before(){
    _n=$1
   [ $_n'X' == 'X' ] && _n=+0
   if [ `os` == "linux" ];then
       date '+%Y-%m-%d' -d "$_n days"
   else
       date -v ${_n}d  "${SIMPLE_FORMAT}"
   fi
}

# date_before


datetime_to_timestamp(){
  _n="$1"
  [ "$_n"'X' == 'X' ] && _n="`current_datetime`"
  if [ `os` == "linux" ];then
    date -d "$_n" +%s
  else
    date -j -f '%Y-%m-%d %H:%M:%S' "${_n}" +%s
  fi
}

# datetime_to_timestamp
# datetime_to_timestamp `datetime_before -1`

timestamp_to_datatime(){
      _n=$1
	[ $_n'X' == 'X' ] && _n=`current_timestamp`
	 if [ `os` == "linux" ];then
        date -d @$_n  "$SIMPLE_FORMAT"
     else
     echo
#        datetime_to_timestamp_py ${_n}
        echo "`python -c "import sys,time; print time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(${_n}))"`"
     fi
}
# timestamp_to_datatime


timestamp_before(){
     datetime_to_timestamp "`datetime_before $1`"
}


#timestamp_before 1