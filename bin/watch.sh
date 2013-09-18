#!/bin/sh

scripts[0]='/usr/bin/node /home/hosting_users/khunthai/apps/khunthai_khunthai/web.js'
scripts[1]='/usr/bin/node /home/hosting_users/khunthai/apps/khunthai_pony/web.js'

ports[0]=8001
ports[1]=8003

for i in 0 1; do
	#echo ${scripts[$i]} ${ports[$i]}
	echo "ping localhost:${ports[$i]}"
	python watch.py localhost ${ports[$i]} 2> /dev/null
	if [ "$?" -gt "0" ]; then
		l=`ps aux | grep "${scripts[$i]}" | wc -l`
		if [ "$l" -lt "2" ]; then
			echo "run... ${scripts[$i]}"
			`${scripts[$i]} &`
		fi
	fi
done
