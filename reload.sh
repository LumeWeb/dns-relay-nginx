#!/bin/sh
while true; do
  inotifywait -e create -e modify --include ".reload" /etc/letsencrypt
  /usr/local/openresty/bin/openresty -s reload
  echo "SSL Certificate Updated"
  rm -f /etc/letsencrypt/.reload
done
