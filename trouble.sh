#!/bin/bash 

number=0
while [ "$number" -lt 10 ]; do
   echo "Number = $number"
   number=$((number+1))
done

number=0
until [ "$number" -ge 10 ]; do
    echo "Number = $number"
    number=$((number+1))
done

echo -n "Enter a number between 1 and 3 inclusive > "
read character
if [ "$character" = "1" ]; then 
   echo "You entered 1."
elif [ "$character" = "2" ]; then
   echo "You entered 2."
elif [ "$character" = "3" ]; then
   echo "You entered 3."
else
   echo "You did not enter a number between 1 and 3."
fi

echo -n "enter a number between 1 and 3 inclusive > "
read character
case $character in
   1 ) echo "You entered 1."
       ;;
   2 ) echo "You entered 2."
       ;;
   3 ) echo "You entered 3."
       ;;
   * ) echo "You did not enter a number between 1 and 3."
esac

echo -n "Type a digit or a letter > "
read character
case $character in
                  #Check for letters
   [[:lower:]] | [[:upper:]] ) echo "You typed the letter $character"
                  ;;
   [0-9] )                     echo "You typed a digit $character"
                  ;;
   * )                         echo "You did not type a letter or digit"
esac

number=0
echo -n "Enter a number > "
read number
echo "Number is $number"
if [ $((number % 2)) -eq 0 ]; then
   echo "Number is even"
else 
   echo "Number is odd"
fi

seconds=0
echo -n "Enter number of seconds > "
read seconds

hours=$((seconds / 3600))
seconds=$((seconds % 3600))
minutes=$((seconds / 60))
seconds=$((seconds % 60))

echo "$hours hour(s) $minutes minte(s) $seconds second(s)"

echo -n "Hurry up and type something > "
if read -s response; then
   echo "Greate You entered: $response"
else 
   echo "Sorry, you are too slow!"
fi

number=1

if [ "$number" = "1" ]; then
   echo "Number equals 1"
else 
   echo "Number does not equal 1"
fi

