# !/bin/bash

# gera o arquivo com o total mensal de impressões de cada usuario

mes=`date +%b-%Y`

touch ../data/$mes.txt
header=`head -n1 ../data/current.txt | awk -F"\t" '{print $1,FS,FS,$5,FS,$6}'`
echo -e "$header" > ../data/$mes.txt
sed '1d' ../data/current.txt  | awk -F"\t" '{print $1,FS,$4,FS,$5}' | sort >> ../data/$mes.txt


echo "relatorio de" $mes "gerado com sucesso"
