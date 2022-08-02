#!/bin/bash
read -p "Enter Marks" marks
if [ $marks -lt 40 ]
then
echo "fail"
elif (( marks>=40 && marks<50 ))
then
echo "Grade C"
elif [ $marks -gt 50 -a $marks -lt 60 ]
then
echo "Grade B"
elif [ $marks -ge 60 -a $marks -lt 70 ]
then
echo "Grade A"
else
echo "Grade O"
fi