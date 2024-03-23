#!/bin/sh

set -e

addgroup -S $FTP_USER && adduser -S $FTP_USER -G $FTP_USER
echo "$FTP_USER:$FTP_USER_PASS" | chpasswd 2>&1 1> /dev/null

chmod 555 "/home/$FTP_USER"
chown nobody:nogroup "/home/$FTP_USER"

touch /etc/vsftpd/vsftpd.userlist
echo "$FTP_USER" | tee -a /etc/vsftpd/vsftpd.userlist

exec $@

