#!/bin/bash

user=$1
file=$2
path=`pwd`

# TODO checagens 
isOk=`bash $path/print-requirements.sh $user $file`



# TODO pre processamento
# TODO processa 
# TODO pos processo
# TODO avisos

# testando a chamada do script
echo $user " ta querendo imprimir " $file
