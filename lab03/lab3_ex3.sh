#!/bin/bash
ct=$(ps -ef | wc -l)
dtime=$(date +"%Y=%m-%d %H:%M:%S")
tofile(){
if [ $ct -lt $1 ]; then
        echo "Max no. of processes exceeded. $dtime" >> lab3_log.txt
else
        echo "There are $ct processes running on this machine $dtime" >> lab3_log.txt

fi
}

toshell(){
if [ $ct -lt $1 ]; then
        echo "Max no. of processes exceeded."
else
        echo "There are $ct processes running on this machine"
fi
}
# this is a comment
echo "type <<1>> for shell output or <<2>> for file output"
read selector #after i wrote this i took a look at how the question passed args and realised this was pointless
if [ $selector == 1 ]; then
	toshell "$1"
elif [ $selector == 2 ]; then
	tofile "$1"
else
	echo "choose actual number"
fi
# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq 3 ]; then
		echo "found the third item"
	fi
done

# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
if [ -z $1 ]; then
	echo "You didn't pass any paraemters to $0"
else
	echo "You passed in $1 to $0"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct


