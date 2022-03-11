#!/bin/bash

#random number entre 0 et 999
# 10 chances to find it
# indices : showing bigger or smaller

# Fonctions

# Make sure input is an int otherwise quit
checkInput()
{
	local -n input=$1
	if ! [[ $input =~ ^[0-9]+$ ]]
	then
		echo "Input invalid... tu as perdu !"
		exit 5
	fi
}

compareNumber()
{
	echo "Devinez le nombre :" ; read response
	checkInput response

	if [[ $response -gt $rand ]]
	then
		echo "Trop grand !"
	elif [[ $response -lt $rand ]]
	then
		echo "Trop petit..."
	elif [[ $response -eq $rand ]]
	then
		echo "Bravo, c'est la bonne reponse !!"
		exit 0
	fi
}

# Var initialisation
rand=$((RANDOM%999))
i=0

# Programme

echo "Bonjour, bienvenue dans le jeu : Trouver le nombre"
echo "vous avez 10 essais."
echo "Le nom est $rand"

for i in {1..10}
do
	compareNumber
	triesLeft=$((10-i))
	if [[ $triesLeft -gt 0 ]] ; then
		echo "il vous reste $triesLeft essais."
	else
		echo "Vous n'avez plus d'essais, c'est perdu !"
		echo "La bonne reponse etait $rand"
		exit 0
	fi
done

#while [[ i -lt 10 ]]
#do
#	compareNumber
#	((i++))
#	triesLeft=$((10-i))
#	if [[ $triesLeft -gt 0 ]] ; then
#		echo "il vous reste $triesLeft essais."
#	else
#		echo "Vous n'avez plus d'essais, c'est perdu !"
#		echo "La bonne reponse etait $rand"
#		exit 0
#	fi
#done
