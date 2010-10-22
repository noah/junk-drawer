#!/bin/sh


source /home/noah/.keychain/$HOSTNAME-sh

LOCAL_QUEUE=/home/noah/print_queue
REMOTE_QUEUE=/cygdrive/c/cygwin/home/noah/gits/github/print-watch.py/queue
REMOTE_USER=noah
REMOTE_HOST=ilmarinen
DISPLAY=:0.0

find $LOCAL_QUEUE -type f | while read file; do
  echo "$(date) / $file"
  scp=$(/usr/bin/scp -P 22222 "$file" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_QUEUE" 2>&1)
  if [[ $? -eq 0 ]]; then
    rm -f "$file"
    bnf=$(basename $file)
    DISPLAY=":0.0" notify-send "sent $bnf"
  else
    DISPLAY=":0.0" notify-send -u critical "problem sending $bnf: $(echo $scp)"
  fi

  # echo "code: $?"
  # echo "cmd: $scp"
done
