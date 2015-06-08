#! /bin/bash
#
#$Author: ee364b08 $
#$Date: 2015-01-20 15:00:35 -0500 (Tue, 20 Jan 2015) $
#$Revision: 73145 $
#$HeadURL: svn+ssh://ece364sv@ecegrid-thin1/home/ecegrid/a/ece364sv/svn/S15/students/ee364b08/Lab01/collect_expr.bash $
#$Id: collect_expr.bash 73145 2015-01-20 20:00:35Z ee364b08 $
if [[ $# < 2 ]]
	then
	echo "usage: collect_expr.bash $@"
	exit 1
fi
if [[ -e $1 ]]
	then
	echo "error output file $1 already exists!"
	exit 2
fi
count=0
count1=0
let intput_num=$#-1
touch "$1"
fout=$1
#echo $fout
while [[ $count1 < $intput_num ]]
do
	if [[ ! -f $2 ]] || [[ ! -r $2 ]]
		then
		echo "error: input file $2 is not readable"
		rm $1
		exit 3
	fi
    while read line
    do
 #   	echo "$line"
    	name=$(echo $line | cut -d' ' -f1)
    	data1=$(echo $line | cut -d' ' -f2)
    	data2=$(echo $line | cut -d' ' -f3)
    	data3=$(echo $line | cut -d' ' -f4)
    	data4=$(echo $line | cut -d' ' -f5)
    	data5=$(echo $line | cut -d' ' -f6)
    	((sum=$data1+$data2+$data3+$data4+$data5))
    	((avg=$sum/5))
    	#echo $data1
    	echo "$name" "$data1" "$data2" "$data3" "$data4" "$data5" "$sum" "$avg" >> $fout
    	count1=$(($count1+1))
    done < $2
    	shift
done


