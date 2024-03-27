#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

mkdir -p /var/log/simple-process-monitor/
cp simple-process-monitor.sh /simple-process-monitor.sh
cp systemd.service /etc/systemd/system/simple-process-monitor.service
cp logrotate.conf /etc/logrotate.d/simple-process-monitor.conf


systemctl daemon-reload
systemctl enable simple-process-monitor
systemctl start simple-process-monitor
