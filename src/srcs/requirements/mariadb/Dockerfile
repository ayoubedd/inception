FROM debian:12.0-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt upgrade -y
RUN apt install --no-install-recommends -y mariadb-server mariadb-client

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir /run/mysqld/
RUN chown -R mysql:mysql /run/mysqld/

EXPOSE 3306

ENTRYPOINT [ "entrypoint.sh" ]

CMD [ "mysqld" ]
