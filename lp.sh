# !/bin/bash


usr=`whoami`
file=$1
path=`pwd`

# chama o script proprio em /scripts
bash $path/scripts/print.sh $usr $file
