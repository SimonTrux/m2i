#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Wrong number of arguments."
	echo "Usage : add.sh <number1> <number2>"
fi

if [ $# -eq 2 ]
then
	res=$(($1+$2))
	echo "Nom du fichier : $0"
	echo "Nombres d'arguments : $#"
	echo "Les arguments sont : $@"
	echo "$1 + $2 est egal a $res"
fi
