# Simple Process Monitor

This is a very simple utility intended to help with troubleshooting performance problems. All it does is capture the top N CPU hungry processes on a linux system every N seconds, and outputs that information to a log file with timestamps.

## Installation

Run `install.sh` as root. This will do the following:

* Copy the primary bash script to `/simple-process-monitor.sh`
* Copy the systemd file to `/etc/systemd/system/simple-process-monitor.service`
* Copy a logrotate configuration file to `/etc/logrotate.d/simple-process-monitor.conf`
* Create a logging directory: `/var/log/simple-process-monitor/`
* Reload systemd services
* Enable a new service called `simple-process-monitor`
* Start the new service called `simple-process-monitor`

## Starting, Stopping, Enabling, Disabling, Status

To enable on boot: `systemctl enable simple-process-monitor`

To disable on boot: `systemctl disable simple-process-monitor`

To start: `systemctl start simple-process-monitor`

To stop: `systemctl stop simple-process-monitor`

To restart: `systemctl restart simple-process-monitor`

Get Status: `systemctl status simple-process-monitor -l`


## Configuration

All configuration exists within the bash script `simple-process-monitor.sh` towards the top of the script. The installed location is `/simple-process-monitor.py` so you would need to edit it there after installation. If you change the configuration when the utility is already running, you need to either restart the service or reboot.


