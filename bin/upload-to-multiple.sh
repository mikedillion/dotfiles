#!/bin/bash

array=(glu0 glu1 glu2 glum)

count=${#array[@]}
index=0
while [ "$index" -lt "$count" ]; do
  echo -e "Copying to ${array[$index]}\n"
  scp $1 ${array[$index]}:/home/ubuntu/

  let "index++"
done

