#!/bin/sh

while true
do
  echo "[sk] killing steamwebhelper"
  { kill $(pidof steamwebhelper) && echo "[fhs] killed!"; } || echo "[fhs] failed!"
  echo "[sk] waiting 0.5 seconds..."
  sleep 0.5
done
