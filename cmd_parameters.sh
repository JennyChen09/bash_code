#!/bin/bash

echo "You start with $# positional parameters"

while [ "$1" != "" ];do
   echo "Parameter 1 equals $1"
   echo "You now have $# positional parameters"
   
   # Shift all the parameters down by one
   shift
done

if [ $# -gt 0 ]; then
   echo "Your command line contains $# arguments"
else 
   echo "Your command line contains no arguments"
fi
