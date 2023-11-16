#!/bin/bash

if [ -z $1 ]
then
grep -h . labfiles/students/groups/* > grep.txt
else
grep -h .  labfiles/students/groups/$1 > grep.txt
fi
cat grep.txt | awk '{ print 30-length, $0 }' | sort -k 1 -n -k 2  |uniq |cut -d" " -f2- | head -10 > res.txt
n=$(grep -h -c . res.txt)
i=0
while [ $i -lt $n ]
do
echo -e "$((i+1)).\t$(tail -$((n-i)) res.txt | head -1)"
((i++))
done
rm -f grep.txt res.txt
