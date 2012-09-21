#!/bin/bash

if [ $# != 3 ]; then
	echo "Usage $0 <jetty request port> <stop port> <stop key>"
	exit 1
fi

PORT=$1
STOPPORT=$2
STOPKEY=$3

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SOLR_HOME="$DIR/solr_3.6.1"

echo "Using SOLR_HOME: $SOLR_HOME"

(cd $DIR/jetty; java -server -Xmx600m -Dname=solr -Dsolr.solr.home=$SOLR_HOME -Djetty.port=${PORT} -DSTOP.PORT=${STOPPORT} -DSTOP.KEY=${STOPKEY} -jar start.jar &)
