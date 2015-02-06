#!/bin/bash
echo "########## START ($1): `date` ##########"
# ICMP
echo "ping -c 1 $1"
ping -c 1 $1
echo '####################'
# ICMP
echo "mtr --no-dns $1 --report --report-cycles=1"
mtr --no-dns $1 --report --report-cycles=1
echo '####################'
# ICMP
traceroute $1
echo '####################'
# TCP
printf 'tcp'
tcptraceroute $1
echo '####################'
# TCP
echo "nmap -F -Pn $1 --open"
nmap -F -Pn $1 --open
echo '####################'
# UDP
echo "nmap -F -Pn -sU $1 --open"
nmap -F -Pn -sU $1 --open | grep -v 'Host is up'
echo "########## END ($1): `date` ##########"
