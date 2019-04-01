#!/bin/bash

ctime="$(date '+%s')"
r=86400
aws="$(aws iam list-users --output text)"
#aws="$(cat /home/ec2-user/lst_new)"
lst="$(echo "$aws" | grep .com | awk '{print $2,$4}' |cut -d'/' -f2 |cut -d'T' -f1 |sed 's/.com /.com*/g')"

for name in $lst 
do
#   dt="$(echo "$name" | awk '{print $2}')"
   wc="$(echo "$name" | cut -d'*' -f2,3,4 | wc -L)"
    if [  $wc -gt 0 ]
     then
	dt="$(echo "$name" | cut -d'*' -f2,3,4)" 
	dt1="$(date '+%s' -d $dt)"
	sb="$(( $ctime - $dt1 ))"
	res="$(( $sb / $r ))"
		if [  $res -gt 120 ]
		     then
		        echo $name $res
		#else
#			echo "no users found"
		fi
#     else
#        echo -e "$name" "None"
    fi
done
echo "******* check completed *******"
#working 
#for name in $lst; do  dt="$(echo "$name" | cut -d'-' -f2,3,4)";dt1="$(date '+%s' -d $dt)"; sb=`expr $ctime - $dt1 `; res=`expr $sb / $r `; echo $name $res ; done
