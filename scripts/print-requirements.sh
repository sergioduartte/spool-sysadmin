# !/bin/bash

user=$1
file=$2
maxChars=108000

# modelo de saida para a permissao 
# ok totalChars
# notOk <motivo>

saida="ok"

# verifica se o arquivo tem mais de 30 paginas
charsFile=`wc -l $file | awk '{print $1}'`
totalChars=$(($maxChars-$charsFile))
if [ $totalChars -lt 1 ]
	then saida="notOk arquivo maior que o permitido para impressao"
fi

# verifica se o usuario tem quota abaixo de 30 impressoes 

quota=`bash get-quota.sh $user`
if [ $quota -lt 1 ]
	then saida="notOk cota excedida"
fi

# retorna se esta ok para condicoes basicas de impressao

echo "$saida"

