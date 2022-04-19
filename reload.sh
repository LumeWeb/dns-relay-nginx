#!/bin/sh
while true; do
  inotifywait -e create -e modify --include ".reload" /data
  /usr/local/openresty/bin/openresty -s reload
  echo "SSL Certificate Updated"
  rm -f /data/.reload
done
