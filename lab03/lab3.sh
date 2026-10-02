#!/bin/bash

# this is a comment
echo "please put in the amount of processes you think are running"
read amount #after i wrote this i took a look at how the question passed args and realised this was pointless
# for loop to count to 10
for c in {1..5}; do
	echo "Count: $c"

	# if does not use == it uses -eq
	# note the spaces around if [ ]
	if [ $c -eq $amount ]; then
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
ct=$(ps -ef | wc -l)
if [ $ct -lt $1 ]; then
	echo "Max no. of processes exceeded."
else
	echo "There are $ct processes running on this machine"
fi

#googled comparison operators in bash, found the stupidest method of comparison on earth
#-lt for less than and -gt for greater than; speechless
