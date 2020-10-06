#!/bin/bash

MAIL_USER="XXXXXXXXXXXXXXXXXX"
MAIL_PASS="XXXXXXXXXXXXXXXXXX"

MAIL=`curl -u $MAIL_USER:$MAIL_PASS --silent https://mail.google.com/mail/feed/atom`
CON=`echo $MAIL | grep -c "<fullcount>"`
NUM=`echo $MAIL | grep -o "<entry>" | wc -l`
RES="err"

if [ $CON -ne 1 ]; then
  RES="err"
else
  RES="$NUM"
fi


if [ $NUM -ge 1 ]; then
  echo -n "#[fg=black,bg=yellow]GMail: $RES"
else
  echo -n "#[fg=black,bg=green]GMail: $RES"
fi
