#!/bin/bash
zone=$1;for arpa in $(host -t ns $zone|awk '{print $4}');do dig $arpa axfr $zone;done
