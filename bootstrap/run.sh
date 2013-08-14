#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SCRIPTS=`find "${DIR}/scripts" -type f -executable -print`
SCRIPTS_LEN=${#SCRIPTS[@]}

ORDERED=""
UNORDERED=""

for SCRIPT in $SCRIPTS
do

  basename $SCRIPT | grep -q '^[[:digit:]]'

  # sort setup scripts into ordered and unordered collections
  if [ $? -eq 0 ]
  then
    ORDERED[${#ORDERED[@]}]=$SCRIPT
  else
    UNORDERED[${#UNORDERED[@]}]=$SCRIPT
  fi
done

echo -n ${ORDERED[@]} | sort -n | xargs -i {} 2>&1 > $DIR/bootstrap.log
echo -n ${UNORDERED[@]} | xargs -i {} 2>&1 >> $DIR/bootstrap.log


