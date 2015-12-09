#!/bin/bash
FROM_EXTENSION="gif"
TO_EXTENSION="jpg"

for fName in `ls | grep .$FROM_EXTENSION`; do
  echo "File: $fName"
  conver $fName ${fName%.*}.$TO_EXTENSION
done

