#!/bin/bash

# script que retorna a quantidade de arquivos e paginas que o usuario imprimiu em determinado mes

# padrao de entrada <usuario> <mes> <ano>

user=$1
month=$2
year=$3

files=`grep $user ../data/$month-$year.txt | awk '{print $2}'`
pages=`grep $user ../data/$month-$year.txt | awk '{print $3}'`


echo "Em $month/$year, o usuario $user imprimiu $files arquivos e $pages paginas."
