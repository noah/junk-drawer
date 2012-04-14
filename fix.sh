#!/bin/zsh

while [[ $# -gt 0 ]]; do

  filename=$(basename $1)
  new_filename=''

  year=$(echo $filename | sed -n -e 's/.*\([0-9]\{4\}\).*/\1/p')
  if [[ ! -z $year ]]; then
    new_filename=$year
    new_filename+=_
    # add non-year stuff back
    new_filename+=$(echo $filename| sed -n -e "s/$year/_/p")
  else
    new_filename=$filename
  fi

  # normalize case
  clean=$(echo $new_filename| tr '[:upper:]' '[:lower:]')
  # sub underscore for junk . . . '[' must be first, '-' must be last
  clean=$(echo $clean | sed "s/[][(){} !,;-]\|v0/_/g")
  clean=$(echo $clean | sed "s/[']//g")
  # strip trailing underscores
  clean=$(echo $clean | sed 's/_*$//') 
  # leading underscores
  clean=$(echo $clean | sed 's/^_*//') 
  # sub ampersands
  clean=$(echo $clean | sed 's/&/and/g')
  new_filename=$clean
  # flatten underscores
  new_filename=$(echo $new_filename | sed 's/[_]\{2,\}/_/g')

  if [[ "$filename" != "$new_filename" ]]; then
    mv -v $filename $new_filename
  else
    print "Skipping $filename"
  fi

  shift
done
