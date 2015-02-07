#!/bin/bash
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   # nmap: You requested a scan type which requires root privileges. QUITTING!
   exit 1
fi

for IP in "$@"
do
	echo -e "\e[45mSTART ($IP): `date`\e[0m"

	echo -e "\e[44mICMP:\e[42mping -c 1 $IP\e[0m"
	ping -c 1 $IP

	echo -e "\e[44mICMP:\e[42mmtr --no-dns $IP --report --report-cycles=1\e[0m"
	mtr --no-dns $IP --report --report-cycles=1

	echo -e "\e[44mICMP:\e[42mtraceroute $IP\e[0m"
	traceroute $IP

	echo -e "\e[44mTCP:\e[42mtcptraceroute $IP\e[0m"
	tcptraceroute $IP

	echo -e "\e[44mTCP:\e[42mnmap -F -Pn $IP --open\e[0m"
	nmap -F -Pn $IP --open

	echo -e "\e[44mUDP:\e[42mnmap -F -Pn -sU $IP --open\e[0m"
	nmap -F -Pn -sU $IP --open | grep -v 'Host is up'
	# -Pn: Treat all hosts as online -- skip host discovery

	echo -e "\e[45mEND ($IP): `date`\e[0m"
done
