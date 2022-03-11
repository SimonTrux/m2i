#!/bin/bash

echo -n "Entrer une valeur :" ; read -r var1
echo -n "Entrer une autre valeur :" ; read -r var2

res=$((var1+var2))


echo "addition de $var1 et $var2 = $((var1+var2))"


printf "Resultat : %.2f\n" $res
