#!/bin/bash


if [ $DOCKER_DEBUG = 1 ]; then
  uname -a
  set
fi

if [ ! -f /.config/sakura ]; then
  echo "dns_sakuracloud_api_token='$SAKURACLOUD_API_TOKEN'"   > /.config/sakura
  echo "dns_sakuracloud_api_secret='$SAKURACLOUD_API_SECRET'" >> /.config/sakura
  chmod 600 /.config/sakura
fi

if [ ! -f /.config/domain ]; then
  echo "export DOMAIN_ADDRESS=$DOMAIN_ADDRESS"  > /.config/domain
  echo "export DOMAIN_MAIL=$DOMAIN_MAIL"       >> /.config/domain
fi
