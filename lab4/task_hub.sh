#!/bin/bash

#Functions

function Prov_SubjectName(){
resalt1=0
while [ $resalt1 -ne 1 ]
do
echo 'Введите название предмета'
read SubjectName
p=$(find . -type d -name "$SubjectName")
if [ ! -z $p ] 
then
resalt1=1
else
echo 'Неверное название предмета'
echo ' '
resalt1=0
fi
done
}


function Prov_Ngroup(){
unset result1
while [ -z $result1 ]
do
echo 'Введите номер группы в формате "A-**-**"'
read Ngroup
for file in labfiles/$SubjectName/tests/TEST-*
do
prov=$(grep -i -h -c "$Ngroup" $file)
if [ $prov -ne 0 ]
then 
result1=1
break
fi
done
if [ $prov -eq $(grep -h -c "" $file) ]
then
unset result1
fi
if [ -z $result1 ]
then
echo 'Неверный номер группы'
echo ' '
fi
done
}

 #main

unset flag
while [ -z $flag ]
do
echo 'Выберите задание: '
echo '1 - Вывод имени студента с максимальным количеством указанных оценок'
echo '2 - Вывод имени студента, не сдавшего хотя бы один тест (с номером теста)'
echo '3 - Вывод номеров пропущенных занятий по фамилии студента'
echo '4 - Вывод ТОП-10 студентов с самыми длинными ФИО'
read vibor
if [ "$vibor" == "1" ]           # task1
then
Prov_SubjectName
Prov_Ngroup $SubjectName
unset flag1
while [ -z $flag1 ]
do
echo 'Введите искомую оценку'
read Score
if [ $Score != 3 ] && [ $Score != 4 ] && [ $Score != 5 ]
then
echo 'Неверная оценка'
echo ' '
else 
flag1=1
fi
done
./task1.sh $SubjectName $Ngroup $Score

elif [ "$vibor" == "2" ]                 # task2
then
Prov_SubjectName
Prov_Ngroup $SubjectName
./task2.sh $SubjectName $Ngroup

elif [ "$vibor" == "3" ]             # task3
then
Prov_SubjectName
unset flag1
while [ -z $flag1 ]
do
echo 'Введите ФИО студента'
read FIO
for filename in labfiles/$SubjectName/*-attendance
do
prov=$(grep -i -h -c "$FIO" $filename)
if [ $prov -ne 0 ]
then 
flag1=1
break
fi
done
if [ -z $flag1 ]
then
echo 'Неверное ФИО студента '
echo ' '
fi
done
./task3.sh $SubjectName $FIO

elif [ "$vibor" == "4" ]                   # task4
then
unset flag3
while [ -z $flag3 ]
do
echo 'Введите номер группы или ENTER (если хотите искать по всем группам)'
read Ngroup
if [ ! -z $Ngroup ]
then
if [ ${Ngroup:0:1} == "a" ]
then
Ngroup="A${Ngroup:1}"
fi
for file in labfiles/students/groups/*
do
if [ $file == "labfiles/students/groups/$Ngroup" ]
then 
flag3=1
break
fi
done
if [ -z $flag3 ]
then
echo 'Неверный номер группы'
echo ' '
fi
else
flag3=1
fi
done
./task4.sh $Ngroup
else
echo 'Неправильный номер задания'
fi
echo ' '
echo 'Хотите ещё раз выбрать задание?'
echo 'Enter - да'
echo 'Любой символ - нет'
echo ' '
read flag
done



