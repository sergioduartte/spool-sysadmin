# !/bin/bash

# gera o arquivo com o total mensal de impressões de cada usuario

mes=`date +%b-%Y`

touch ../data/$mes.txt

sed -n '1p' ../data/current.txt | awk -F"\t" '{print $1,FS,FS,$5,FS,$6}' > ../data/$mes.txt
sed '1d' ../data/current.txt  | awk -F"\t" '{print $1,FS,$4,FS,$5}' >> ../data/$mes.txt

