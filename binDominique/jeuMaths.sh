#!/bin/bash

# Faire un jeu de calcul avec 10 additions

# Fonctions
division() {
	num1=$((RANDOM%9+1))
	num2=$((RANDOM%9+1))

	tmp=$((num1*num2))

	echo "$tmp / $num2 = "
	read res
	echo "Votre resultat : $res"
	if [[ $res -eq $num1 ]]
	then
		echo -e "Right !\n"
		((points++))
	else
		echo -e "Wrong...\n"
	fi
}

calcul() {
	if [[ $1 == "/" ]] ; then division ; return ; fi   # gestion de la division juste

	ope=$1
	num1=$((RANDOM%9+1))
	num2=$((RANDOM%9+1))

	echo "$num1 $ope $num2 = "

	read res
	echo "Votre resultat : $res"
	if [[ $res -eq $(($num1$ope$num2)) ]]
	then
		echo -e "Right !\n"
		((points++))
	else
		echo -e "Wrong...\n"
	fi
}

randChoice() {
	local -n _randomChoice=$1
	i=$((RANDOM%4+1))
	case $i in
		1)_randomChoice="+" ;;
		2)_randomChoice="-" ;;
		3)_randomChoice="*" ;;
		4)_randomChoice="/" ;;
	esac
}

# Variable Definition

points=0

# 		Programme 
# Menu
echo -e "Voici le jeu du calcul mental. Vous devez trouver le resultat.\n"
echo "Veuillez choisir votre jeu !"
echo -e "\n\t1 - les additions"
echo -e "\t2 - les soustractions"
echo -e "\t3 - les multiplications"
echo -e "\t4 - les divisions"
echo -e "\t5 - un mix de tout ca ! Random FTW"
echo -e "\t6 - quitter\n"
echo "Choisir le jeu : " ; read rep

case $rep in
	1)choice="+" ; echo "Vous avez choisi les additions." ;;
	2)choice="-" ; echo "Vous avez choisi les soustractions.";;
	3)choice="*" ; echo "Vous avez choisi les multiplications." ;;
	4)choice="/" ; echo "Vous avez choisi les divisions." ;;
	5)choice="random" ; echo "Vous avez choisi RANDOM !!" ;;
	6|q|Q|quit|exit)echo "Au revoir !" ; exit 0 ;;
	*) echo "input invalide !" ; exit 5 ;;
esac

# Debut du jeu choisi 
echo -e "\n\tDebut du jeu : \t\n"
start=$(date +%s)

for i in {1..10}
do
	echo "Calcul numero $i"
	
	# Gestion du mode Random
	if [[ $choice = "random" ]]
	then randChoice choice ; calcul "$choice" ; choice="random"
	else
		# Mode normal
		calcul "$choice"
	fi
done

# little addidition : time elapsed 
end=$(date +%s)
timeElapsed=$(( (end - start) / 1 ))
echo "Vous terminez le jeu avec $points/10, in $timeElapsed seconds."

exit 0
