#/bin/bash

PORT=$1

if [ -z $PORT ]; then
	PORT="8983"
fi

curl "http://localhost:${PORT}/solr/photo_core/update?commit=true" -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
