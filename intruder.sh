#!/bin/bash
# for https://github.com/adamziaja/python/blob/master/ske.py
for expl in $(ls -1)
do
  echo $expl
  chmod +x $expl
  if [ "`echo $expl | awk -F'.' '{print $2}'`" == "sh" ];then
    ./$expl
  elif [ "`echo $expl | awk -F'.' '{print $2}'`" == "py" ];then
    python $expl
  elif [ "`echo $expl | awk -F'.' '{print $2}'`" == "rb" ];then
    ruby $expl
  else
    ./$expl
  fi
done
