#!/bin/bash
# for https://github.com/adamziaja/python/blob/master/ske.py
SELF=`echo $0 | sed 's/\/.//g'`
for expl in $(ls -1 | sort -r | grep -v $SELF);do
  echo $expl
  chmod +x $expl
  TYPE="`echo $expl | awk -F'.' '{print $2}'`"
  if [ -z $TYPE ];then
    TYPE="none"
  fi
  if [ $TYPE == "sh" ];then
    ./$expl
  elif [ $TYPE == "py" ];then
    python $expl
  elif [ $TYPE == "rb" ];then
    ruby $expl
  else
    ./$expl
  fi
done
