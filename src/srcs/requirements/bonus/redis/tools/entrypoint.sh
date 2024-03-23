#!/bin/sh

sed -i "/^#.*requirepass.*foobared/c\requirepass $REDIS_PASS" "$2"
sed -i "/^protected-mode.*yes/c\protected-mode no" "$2"
sed -i "/^bind 127.0.0.1 -::1/c\bind * -::*" "$2"

exec $@
