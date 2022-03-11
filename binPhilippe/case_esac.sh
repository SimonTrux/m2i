#!/usr/bin/bash

Entree(){
	read -r key
}

while :
do
	clear
	echo -n "Quitter (y/n) ?"; read rep
	case $rep in
		y|Y|o|O|Yes|yes|Oui|oui)
			exit 0 ;;
		n|N|no|No|NO|non|Non|NON)
			echo -e "You said no !\nPress Enter";
			Entree;;

		*) echo -e "Input invalide"
			exit 1
			;;
	esac
done
