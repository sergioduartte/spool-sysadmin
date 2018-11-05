# !/bin/bash


usr=`whoami`
file=$1

# chama o script proprio em /scripts

bash ~/spool-sysadmin/spool-sysadmin/scripts/print.sh $usr $file 
