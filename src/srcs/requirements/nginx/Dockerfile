FROM debian:12.0-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install --no-install-recommends -y nginx openssl vim

RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./conf/default etc/nginx/sites-enabled/default
COPY ./conf/blog etc/nginx/sites-enabled/blog
COPY ./conf/adminer etc/nginx/sites-enabled/adminer
COPY ./conf/uptime-kuma etc/nginx/sites-enabled/uptime-kuma

RUN mkdir -p /etc/ssl/42.fr/

COPY ./certs/wildcard.42.fr.crt /etc/ssl/42.fr/
COPY ./certs/wildcard.42.fr.key /etc/ssl/42.fr/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

