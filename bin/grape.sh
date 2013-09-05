#!/bin/sh

if [ $# -lt 2 ]; then
	echo 'username and hostname, please.'
	exit 1
fi

echo "ssh -A -t hongikeam@grape ssh -A -t $1@$2"
ssh -A -t hongikeam@grape ssh -A -t $1@$2
