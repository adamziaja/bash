#!/bin/sh
domain=$1
java -jar TestSSLServer.jar $domain 443 | egrep "vulnerable|weak|SSLv2" # http://www.bolet.org/TestSSLServer/
echo;echo
python heartbleed.py $domain # http://www.exploit-db.com/exploits/32745/
