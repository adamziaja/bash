#!/bin/bash
for file in $(find ~/Wideo/ -maxdepth 2 -type f -size +100M -iname "$1");do echo $file && qnapi -c $file && echo;done
