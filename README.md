# Summary

    Ubuntu Certbot container.

# Description

    Wildcart Let's Encrypt Docker container.
    for Sakura Cloud.

# Changelog

## build-version 0

    First Commit / base ubuntu:18.04

# Usage

## Configuration

### --env

    DOCKER_DEBUG 0
    SAKURACLOUD_API_TOKEN=Sakura Cloud Token.
    SAKURACLOUD_API_SECRET=Sakura Cloud Secret Key.
    DOMAIN_ADDRESS=SSL Domain Name. (*.e-software.company > e-software.company)
    DOMAIN_MAIL=SSL Domain Mail. (test@e-software.company)

### --port

    None

### --volume

    /.config
    /.docker
    /ssl

## Examples

### Pull docker container

    docker pull sonohara/ubuntu-certbot

### Start docker container

    It's base container. this not run.

### Entrypoint

    /entrypoint.sh

# ToDo

    Other DNS Authority.

# Other

## Copyright and license

- Code released under [GNU GENERAL PUBLIC LICENSE Version 3](https://github.com/ksonohara/docker-ubuntu-base/blob/master/LICENSE)

## Author

K.Sonohara
- GitHub: https://github.com/ksonohara
- Homepage: [ExpertSoftware Inc.](https://www.e-software.company "ExpertSoftware Inc.")
