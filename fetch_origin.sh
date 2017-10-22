#!/bin/bash

SERVERS="app1 app2 app3"

for S in $SERVERS
do
    mkdir -p ./_origin/$S/etc/
    mkdir -p ./_origin/$S/home/

    for d in "/etc/nginx" "/etc/mysql" "/etc/redis" "/etc/sysctl.d/" "/etc/sysctl.conf" "/etc/systemd"
    do
	echo ./_origin/$S$d
	if [ -e ./_origin/$S$d ]; then
	    echo ./_origin/$S$d exist SKIP
	    continue
	fi
	scp -r $S:$d ./_origin/$S$d
    done

done
