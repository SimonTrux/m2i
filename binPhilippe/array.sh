#!/usr/bin/bash

days=( "lundi" "mardi" "mercredi" "jeudi" "vendredi" "samedi" "dimanche" )

echo "${days[*]}" 
echo "${#days[*]}" 

echo -e "\nversion for loop\n"

for i in ${days[*]}
do
	echo "$i"
done

echo -e "\nversion while loop\n"
count=0
while (( count < ${#days[*]} ))
do
	echo "${days[$count]}"
	((count++))
done
