# inception

## Table of Contents
- [Overview](#overview)
- [Diagram](#diagram)
- [Requirements](#requirements)
- [Setup](#setup)
- [Build](#build)
- [Lisence](#lisence)

## Overview

`inception` is a hands on educational project for learning docker and docker compose. The project is about building a small infrastructure using docker and docker compose.

This infrastructure composed of several services that should be containerized. and fully automated for building and running.

The services are:

- Wordpress
- Redis
- Nginx
- Mariadb 
- ADDITIONALLY:
    - adminer
    - blog
    - ftp-server
    - redis
    - uptime-kuma

For more informations. Refer to subject file included in the subject directory.

## Diagram

The following is a dragram screenshotted from the subject.

![inception digram](/images/diagram.png)

## Requirements

To build and run this project all you need is docker.

## Setup

Before starting to build the project we need to some .env files beforehand.

Inside `srcs` directory there is a set of `.env*` files which you need to remove the `.exmpl` part of the name and fill the varialbes with the corresponding values

Also you need to generate a self-signed certificate since all the traffic should encrypted. The certificates should be places inside a `nginx/certs` directory. and containing two files.

The cert file should be named `wildcard.42.fr.crt` and private key `wildcard.42.fr.key`.

## Build

To build the project you simple cd into `src` directory and run the following command:

```sh
make
```

And then after the database and wordpress finished setup (this is only done the first time), you can visite the wordpress site by going to `localhost:443`.

## Lisence

This project is licensed under MIT license. See the LICENSE file for details.
