#!/bin/bash

if [ $# != 2 ]; then
	echo "Usage $0 <stop port> <stop key>"
	exit 1
fi


PORT=$1
KEY=$2

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

(cd $DIR/jetty; java -DSTOP.PORT=${PORT} -DSTOP.KEY=${KEY} -jar start.jar --stop )
