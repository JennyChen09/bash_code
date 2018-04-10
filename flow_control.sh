#!/bin/bash

count=0
for i in $(cat sysinfo_page.html); do
    count=$((count+1))
  echo "Word $count ($i) contains $(echo -n $i | wc -c) characters"
done

for filename in "$@"; do
   result=
   if [ -f "$filename" ]; then
      result="$filename is a regular file"
   else
      if [ -d "$filename" ]; then
          result="$filename is a directory"
      fi
   fi
   if [ -w "$filename" ]; then
      result="$result and it is writable"
   else
      result="$result and it is not writable"
   fi
   echo "$result"
done
