#!/bin/bash

tags=(ops solr test production)

count=${#tags[@]}
index=0
while [ "$index" -lt "$count" ]; do
  cap -Stag=${array[$index]} $1 2>&1

  let "index++"
done
