#!/bin/bash

#script que retorna quanto de quota o usuario ainda tem
# <nomeDoUsuario>
user=$1
quota=30

used=`grep $user ../data/current.txt | awk '{print $2}'`
#disponivel
echo $(($quota - $used))
