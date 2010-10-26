#!/bin/sh

while read LINE; do
    echo $LINE >> /var/log/crond.mail.log 2>&1
done
