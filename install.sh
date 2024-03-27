#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi


cp simple-process-monitor.sh /simple-process-monitor.sh
cp simple-process-monitor.service /etc/systemd/system/simple-process-monitor.service

systemctl daemon-reload
systemctl enable simple-process-monitor
systemctl start simple-process-monitor
