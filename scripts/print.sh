# !/bin/bash

user=$1
file=$2
path=`pwd`

# checagens
isOk=`bash $path/print-requirements.sh $user $file | grep notOk`

if [ "$isOk" != "" ]; then
	errorMessage=`echo $isOk | awk '{print $2FS$3}'`
	echo "nao foi possivel imprimir $file. Causa: $errorMessage"
	exit 1
fi

# imprime
# /usr/bin/lp $file

# processa
userQuota=`bash get-quota.sh $user`
fileSize=$(echo "$(wc -m $file | awk '{print $1}') / 3600" | bc)
userPrinted=`bash get-actual-use.sh $user`
filesPrinted=$(grep $user ../data/current.txt | awk '{print $4}')

# caso a quantidade de caracteres a serem impressos caibam em uma so pagina
if [ $fileSize -lt 1 ]; then
		fileSize=1 
fi
newPrintedPages=$(($fileSize + $userPrinted))
echo $newPrintedPages "oxe..."

overflowQuota=0

## caso a impressao seja maior que a cota do usuario
if [ $newPrintedPages -gt 30 ]; then
	overflowQuota=$(($newPrintedPages - 30))
	newPrintedPages=30
	echo "to passando aqui"
fi

## atualiza o bd
##<usuario><quota><excedente><arquivos><total-impressoes>
newString="$user\t$newPrintedPages\t$overflowQuota\t$(($filesPrinted + 1))\t$(($newPrintedPages + $overflowQuota))"
sed -i "/$user/d" ../data/current.txt
echo -e $newString >> ../data/current.txt

# imprimir quanto de cota resta ao usuario
echo "o usuario ainda tem "$(bash get-quota.sh $user) "paginas de cota"
