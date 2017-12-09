#!/bin/sh

set -euxo pipefail


# create new cert for specific IP
openssl req \
  -new \
  -newkey rsa:4096 \
  -days 365 \
  -nodes \
  -x509 \
  -subj "/CN=$PUBLIC_IP" \
  -keyout /awesome.key \
  -out /awesome.cert

# set that IP in nginx config
envsubst '\$PUBLIC_IP \$TARGET_PORT' \
  < nginx.conf.template > /etc/nginx/nginx.conf

# show config
cat /etc/nginx/nginx.conf

# start ssl termination
nginx -g 'daemon off;'
