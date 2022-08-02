#!/bin/bash
read -p "Enter two numbers:" num1 num2
until((next == 1))
do
echo "Choose Operation: "
read -p "1:add, 2:sub, 3:mul, 4:div, 5:mod :" ch
case $ch in
        1) echo "$(expr $num1 + $num2)" ;;
        2) echo "$(expr $num1 - $num2)";;
        3) echo "$(($num1 * $num2))";;
        4) echo " ` expr $num1 / $num2 ` ";;
        5) echo "$(($num1 % $num2 ))" ;;
        *) echo "Invalid Choice";;
 esac
read -p "Whether you want to continue (Yes:0/ No:1)"  next
done