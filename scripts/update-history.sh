# !/bin/bash

# atualiza os arquivos current.txt, last.txt baseados no consumo mensal.

# gera o arquivo mensal
# current -> mes-ano.txt
bash gen-history.sh  


# o last eh utilizado como um arquivo auxiliar somente na hora de atualizar o consumo
## last -> current	
#header=`head -n1 ../data/current.txt`
#echo -e "$header" > ../data/current.txt
#sed '1d' ../data/current.txt  | awk -F"\t" '{print $1,FS,$4,FS,$5}' | sort >> ../data/$mes.txt





echo "ready to work!!"
