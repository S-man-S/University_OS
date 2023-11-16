#!/bin/bash

for i in {1..4}
do
if [ ! -z $(find "labfiles/$1/" -name "TEST-$i") ]
then
grep -i "$2" labfiles/$1/tests/TEST-$i | grep 2$ | awk -F ";" '{print $2}' | uniq > grep$i.txt
fi
done
cat grep*.txt | sort | uniq > grep.txt
if [ -z $(head -1 grep.txt) ]
then
echo "Все студенты сдали тесты"
else
for student in $(cat grep.txt)
do
str="${student}"
for i in {1..4}
do
count=$(grep -c ${student} grep$i.txt)
if ((count != 0))
then
str="${str} $i"
fi
done
echo "${str}"
done
fi
rm -rf grep*.txt