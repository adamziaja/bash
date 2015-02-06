#!/bin/bash
echo "########## START ($1): `date` ##########"
echo "ping -c 1 $1"
ping -c 1 $1
echo '####################'
echo "mtr --no-dns $1 --report --report-cycles=1"
mtr --no-dns $1 --report --report-cycles=1
echo '####################'
traceroute $1
echo '####################'
printf 'tcp'
tcptraceroute $1
echo '####################'
echo "nmap -F -Pn $1 --open"
nmap -F -Pn $1 --open
echo '####################'
echo "nmap -F -Pn -sU $1 --open"
nmap -F -Pn -sU $1 --open
echo "########## END ($1): `date` ##########"
