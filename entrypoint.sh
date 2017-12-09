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
  < stunnel.conf.template > /etc/stunnel/stunnel.conf

# show config
cat /etc/stunnel/stunnel.conf

# start ssl termination
stunnel
