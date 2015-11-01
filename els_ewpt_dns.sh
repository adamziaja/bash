#!/bin/bash
# ./els_ewpt_dns.sh info.introduction.site info.infogat.site
for host in $(echo $1);do ip=`dig @10.100.13.37 +short $host` && sudo sh -c "echo $ip $host >> /etc/hosts";done
