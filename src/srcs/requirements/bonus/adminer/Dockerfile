FROM alpine:3.17.3

RUN apk update && apk upgrade
RUN apk add php php-session php-mysqli

WORKDIR /var/www/
RUN wget -O index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php

RUN addgroup -S adminer && adduser -S adminer -G adminer
RUN chown -R adminer:adminer /var/www/

USER adminer
EXPOSE 80

CMD	[ "php", "-S", "[::]:80", "-t", "/var/www" ]

