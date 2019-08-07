FROM ubuntu:18.04
MAINTAINER Expert Software Inc. / https://www.e-software.company

LABEL name="Ubuntu 18.04 Certbot Image" \
      vendor="ExpertSoftware Inc." \
      license="GPLv3" \
      build-date="20180701" \
      build-tag="1.0.0_0" \
      build-version="0"

RUN mkdir /.docker

ENV DEBIAN_FRONTEND=noninteractive
ENV DOCKER_DEBUG 0

ENV SAKURACLOUD_API_TOKEN=
ENV SAKURACLOUD_API_SECRET=
ENV DOMAIN_ADDRESS=
ENV DOMAIN_MAIL=

RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN apt-get install -y python-setuptools python-pip python-openssl
#RUN pip install PyOpenSSL
RUN pip install certbot
RUN pip install certbot-dns-sakuracloud

COPY entrypoint.sh /entrypoint.sh
COPY init.sh /.docker/init.sh
COPY service.sh /.docker/service.sh
COPY setup.sh /.docker/setup.sh
RUN chmod +x /entrypoint.sh

RUN mkdir /ssl

ENTRYPOINT ["/entrypoint.sh"]

VOLUME ["/.config", "/.docker", "/ssl"]
