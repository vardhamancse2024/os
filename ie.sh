#!/bin/sh
read -p "enter marks" marks
if [ $marks -lt 40 ]
then
echo  -n "fail"
elif [ $marks -ge 40 -a $marks -le 50 ]
then
echo "grade C"
else
echo "first class"
fi
