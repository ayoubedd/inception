FROM alpine:3.17.3

RUN apk update && apk upgrade
RUN apk add vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]

EXPOSE 20-21
EXPOSE 10000-10100

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
