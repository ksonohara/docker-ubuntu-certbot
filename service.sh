#!/bin/bash

if [ $DOCKER_DEBUG = 1 ]; then
  cat /.config/sakura
  cat /.config/domain
fi
source /.config/domain
cat /.config/sakura

if [ ! -f /etc/letsencrypt/archive/$DOMAIN_ADDRESS ]; then
certbot certonly --dns-sakuracloud \
  --dns-sakuracloud-credentials /.config/sakura \
  -d $DOMAIN_ADDRESS \
  -d *.$DOMAIN_ADDRESS \
  -m $DOMAIN_MAIL \
  --manual-public-ip-logging-ok \
  --agree-tos \
  --no-eff-email
fi

if [ -f /etc/letsencrypt/archive/$DOMAIN_ADDRESS ]; then
certbot renew --dns-sakuracloud \
  --dns-sakuracloud-credentials /.config/sakura \
  -d $DOMAIN_ADDRESS \
  -d *.$DOMAIN_ADDRESS \
  -m $DOMAIN_MAIL \
  --manual-public-ip-logging-ok \
  --agree-tos \
  --no-eff-email
fi

if [ $DOCKER_DEBUG = 1 ]; then
  cat /var/log/letsencrypt
  find /etc/letsencrypt
fi

cp -arf /etc/letsencrypt/archive/$DOMAIN_ADDRESS /ssl/.
