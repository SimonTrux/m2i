#!/usr/bin/bash

# Definition liste
fruitList=("pomme" "poire" "banane" "kiwi")

# Fonction affichage tableau
showtab() {
	echo "While Loop begin in showtab function"
	count=0
	while (( count < ${#fruitList[*]} ))
	do
#		echo "$count"
		echo "${fruitList[count]}"
		((count++))
	done
}

# Fonction ajout dans le tableau
add_to_beginning() {
	local f=$1
	fruitList=( "$f" ${fruitList[*]} )
}

add_to_end() {
	elem=$1
	local -n tab=$2		# the local -n 
	tab=( ${tab[*]} "$elem" )
	echo "elem value : $elem"
	echo "fruitList value : ${tab[*]}"
}

# Programme

showtab

read -p "Quel fruit voulez vous ajouter au debut ?" input_beg
add_to_beginning "$input_beg"
showtab

read -p "Quel fruit voulez vous ajouter a la fin ?" input_end
add_to_end "$input_end" fruitList
showtab

# OLD FOR LOOP
#echo "For Loop begin :"
#for fruit in ${fruitList[*]}
#do
#	echo "${fruit}"
#done
