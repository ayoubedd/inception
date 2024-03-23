FROM alpine:3.17.3

RUN apk update && apk upgrade
RUN apk add redis

COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 6379

ENTRYPOINT [ "entrypoint.sh" ]

CMD [ "redis-server", "/etc/redis.conf" ]
