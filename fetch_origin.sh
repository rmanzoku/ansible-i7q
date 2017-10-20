#!/bin/bash

SERVERS="172.31.18.220"

for S in $SERVERS
do
    mkdir -p ./_origin/$S/etc/
    mkdir -p ./_origin/$S/home/

    for d in "/etc/nginx" "/etc/mysql" "/etc/redis" "/etc/sysctl.d/" "/etc/sysctl.conf" "/home/isucon"
    do
	echo ./_origin/$S$d
	if [ -e ./_origin/$S$d ]; then
	    echo ./_origin/$S$d exist SKIP
	    continue
	fi
	scp -r $S:$d ./_origin/$S$d
    done

done
