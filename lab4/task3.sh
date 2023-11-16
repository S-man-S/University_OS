#!/bin/bash

data=$(grep -i -h "$2" labfiles/$1/*-attendance  | awk -F " " '{print $2}')
famil=$(grep -i -h "$2" labfiles/$1/*-attendance  | awk -F " " '{print $1}')
echo "$famil"
i=0
kol=0
while [ $i -lt ${#data} ]
do
if [ "${data:i:1}" == "0" ]
then 
((kol++))
if [ $kol -eq 1 ]
then
echo 'Номера пропущенных занятий'
echo -n "$((i+1))"
elif [ $kol -gt 1 ]
then
echo -n ", $((i+1))"
fi
elif [ $kol -eq 0 ] && [ $i -eq $((${#data}-1)) ]
then
echo -n 'Нет пропущенных занятий'
fi
((i++))
done
echo ''
