#!/bin/bash

#script que retorna quanto de quota o usuario ainda tem

user=$1
used=`grep $user ../data/current.txt | awk '{print $2}'`

quota=30
echo $(($quota - $used))
