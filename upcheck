#!/bin/sh

pingCheck=`${pingLocation} -c 20 $1 | grep $1: | wc -l`

if [ "${pingCheck}" -lt "2" ]
then

	pingCheckMsg=`cat ~/upcheck-${1}-.msg`
	if [ "${pingCheckMsg}" != "Host unreachable" ]
	then
		# Then make alert and store alert in upcheck-${1}-.msg
		echo "Host unreachable" > ~/upcheck-${1}-.msg
		mail -s "[PROBLEM] Host $1 ping returned < 10%" $2 < /dev/null
	fi
else

	pingCheckMsg=`cat ~/upcheck-${1}-.msg`
	if [ "${pingCheckMsg}" != "Host reachable" ]
	then
		# Then make alert and store alert in upcheck-${1}-.msg
		echo "Host reachable" > ~/upcheck-${1}-.msg
		mail -s "[SOLVED] Host $1 ping returned > 10%" $2 < /dev/null
	fi
fi
