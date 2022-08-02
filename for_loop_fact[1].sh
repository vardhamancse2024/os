echo -n "Enter a number: "
read number
factorial=1
for(( i=1; i<=number; i++ ))
do
  #echo $factorial
  factorial=$[ $factorial * $i ]
done
echo "The factorial of $number is $factorial"
