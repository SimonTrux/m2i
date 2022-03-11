#!/usr/bin/bash

ntree(){
	read -r key
}

while :
do
	clear
	echo -n "Quitter (y/n) ?"; read rep
	rep=$( echo $rep | tr '[[:lower:]]' '[[:upper:]]' )
	case $rep in
		Y|YE|YES|O|OUI)
			exit 0
			;;

		N|NO|NON)
			echo -e "You said no !\nPress Enter";
			ntree
			;;

		*) echo -e "Input invalide" >&2
#			ntree
#			exit 1
			;;
	esac
done
