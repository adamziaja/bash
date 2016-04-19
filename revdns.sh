#!/bin/bash
domain=google.pl;for ip in $(host -t a $domain | awk '{print $4}');do host -t ns `echo $ip | awk 'BEGIN { FS="."; OFS = "." }{ print $3, $2, $1 ".in-addr.arpa" }'`; host -t ns `echo $ip | awk 'BEGIN { FS="."; OFS = "." }{ print $2, $1 ".in-addr.arpa" }'` ;done
