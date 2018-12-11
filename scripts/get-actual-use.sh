# !/bin/bash

# script que retorna o uso de paginas impressas pelo usuario ate o momento

user=$1

echo $(grep $user ../data/current.txt | awk '{print $5}')


