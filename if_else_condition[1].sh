#!/bin/bash
read -p "Enter a +ve number" num
if [ ` expr $num % 2 ` -eq 0 ]
#if((num%2==0))
then
echo "$num is even"
else
echo "$num is odd"
fi