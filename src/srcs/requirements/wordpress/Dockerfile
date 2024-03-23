FROM debian:12.0-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install --no-install-recommends -y php \
  php-fpm \
  php-json \
  php-curl \
  php-xml \
  php-zip \
  php-mbstring \
  php-mysql \
  php-bcmath \
  php-common \
  php-gd \
  php-cli \
  php-imagick \
  ca-certificates \
  mariadb-client \
  openssl \
  curl \
  tar

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/

RUN	curl -so /usr/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x /usr/bin/wp

COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN useradd -mr wordpress

RUN mkdir -p /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress
RUN chown -R wordpress:wordpress /var/www/wordpress

EXPOSE 9000

WORKDIR /var/www/wordpress

ENTRYPOINT [ "entrypoint.sh" ]

