#!/bin/bash

# Definir l'usage
usage="Usage : calcul.sh <number1> <operator> <number2>\n\
	Operator available : + - x . / %.  The wildcard * does not work, use x or . instead."

# Verification de la presence de 3 arguments
if [ $# -ne 3 ]
then
	echo "Wrong number of arguments, calcul.sh needs exacly 3 !"
	echo -e "$usage"
	exit 1
fi

# Verification de l'operateur
operatorList=( "+" "\+" "-" "x" "\*" "." "/" "%" )

if [[ ! " ${operatorList[*]} " =~ ${2} ]]
then
	echo "Operator invalid"
	echo -e "$usage"
	exit 1
fi


num1=$1
operator=$2
num2=$3

if [ "$operator" = "x" ] || [ "$operator" = "." ]
then
#	echo "second argument is x"
	operator="*"
fi

if [ $# -eq 3 ]
then
	res=$(($num1$operator$num2))
	echo "Nom du fichier : $0"
	echo "Nombres d'arguments : $#"
#	echo "Les arguments sont : $@"
	echo "$num1 $operator $num2 est egal a $res"
fi
