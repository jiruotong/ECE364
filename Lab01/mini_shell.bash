#! /bin/bash
#
#$Author: ee364b08 $
#$Date: 2015-01-20 13:56:31 -0500 (Tue, 20 Jan 2015) $
#$Revision: 73078 $
#$HeadURL: svn+ssh://ece364sv@ecegrid-thin1/home/ecegrid/a/ece364sv/svn/S15/students/ee364b08/Lab01/mini_shell.bash $
#$Id: mini_shell.bash 73078 2015-01-20 18:56:31Z ee364b08 $
#count=1
while $1
do
echo -n "Enter a commond:"
read input
echo "$input"
if [[ $input == 'hello' ]]
	then
	echo "Hello $USER"
elif [[ $input == 'quit' ]]
	then
	echo "Exiting..."
	exit 0
elif [[ $input == 'compile' ]]
	then
	echo -n "Enter filename: "
	read file
	echo "$file"
	if [[ -r $file ]]
		then
		gcc -Wall -Werror $file
		if [[ $? == 0 ]]
			then
			echo "Complation succeeded"
		else
			echo "Complation failed"
		fi
	else
		echo "That file does not exist"
	fi
else
	echo "Error: Unrecognized input"
fi
done


