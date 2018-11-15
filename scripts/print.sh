#!/bin/bash

user=$1
file=$2
path=`pwd`

# checagens
isOk=`bash $path/print-requirements.sh $user $file`

if [ `echo $isOk | grep notOk` -ne "" ]; then
	errorMessage=`echo $isOk | awk '{print $2}'`
	echo "nao foi possivel imprimir $file. Causa: $errorMessage"
	exit 1
fi

# imprime
/usr/bin/lp $file

# processa
userQuota=`get-quota.sh $user`
fileSize=`echo "$(wc -m teste.txt | awk '{print $1}') / 3600" | bc`
userPrinted=`echo "$(wc -m teste.txt | awk '{print $4}'`

## caso a quantidade de caracteres a serem impressos caibam em uma so pagina
if [ $filesize -lt 1 ]; then
		fileSize=1 
fi

newQuota=$(($userQuota - $fileSize))

overflowQuota=0

## caso a impressao seja maior que a cota do usuario
if [ $newQuota -lt 0 ]; then
	overflowQuota=$newQuota
	newQuota=0
fi

## atualiza o bd
newString="$user\t$newQuota\t$overflowQuota\t$(($userPrinted + 1))"
sed -i '/$user/d' ../data/aaaaa.txt
echo -e $newString >> ../data/aaaaa.txt


# TODO avisos
## imprimir quanto de cota resta ao usuario

# testando a chamada do script
echo $user " ta querendo imprimir " $file
