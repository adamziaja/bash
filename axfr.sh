#!/bin/sh
domain=$1
for dns in $(host -t ns $domain | awk '{print $4}');do dig @$dns axfr $domain;done
