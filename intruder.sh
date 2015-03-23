#!/bin/bash
# for https://github.com/adamziaja/python/blob/master/ske.py
for expl in $(ls -1);do
  echo $expl
  chmod +x $expl
  TYPE=`echo $expl | awk -F'.' '{print $2}'`
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
