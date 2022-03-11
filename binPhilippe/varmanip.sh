#!/bin/bash

adress="bob@staff.local"
fichier="/home/bob/dev/main.c"
machine="websrv.staff.local"

echo "Login : ${adress%@*} Adresse : ${adress#*@}"
echo "fichier : ${fichier##*/}"
echo "machine : ${machine%%.*}"
