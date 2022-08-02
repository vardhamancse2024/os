#!/bin/bash
read -p "enter two numbers" num1 num2
echo "choice an operation"
read -p "1:addtion, 2:sub, 3:mul, 4:divison 5:module :" ch
case $ch in
	1)echo " addition $(expr $num1 + $num2)";;
	2)echo "subraction $(expr $num1 - $num2)";;
	3)echo " multply$(($num1 * $num2))";;
	4)echo " ' divison expr $num1 / $num2 ' ";;
	5)echo "mod $(( $num1 % $num2))";;
	*)echo "enter correct choice";;
esac
