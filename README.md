# Simple Process Monitor

This is a very simple utility intended to help with troubleshooting performance problems. It captures system memory information and the top N CPU and memory hungry processes on a linux system every N seconds, and outputs that information to a log file with timestamps.

## Installation

Run `install.sh` as root. This will do the following:

* Copy the primary bash script to `/simple-process-monitor.sh`
* Copy the systemd file to `/etc/systemd/system/simple-process-monitor.service`
* Copy a logrotate configuration file to `/etc/logrotate.d/simple-process-monitor.conf`
* Create a logging directory: `/var/log/simple-process-monitor/`
* Reload systemd services
* Enable a new service called `simple-process-monitor`
* Start the new service called `simple-process-monitor`

## Logs

The log containing process information is located here: `/var/log/simple-process-monitor/simple-process-monitor.log`

If the script outputs anything to StandardOutput, that will be located here: `/var/log/simple-process-monitor/StandardOutput.log`

If the script outputs anything to StandardError, that will be located here `/var/log/simple-process-monitor/StandardError.log`

A logrotate configuration is setup to rotate the files within  `/var/log/simple-process-monitor/` on a weekly basis, if the files reach 10M in size.

## Output Format

Each monitoring cycle outputs the following information:
* Timestamp header
* Free memory statistics (from `free -h` command)
* Top N CPU consuming processes with %CPU, %MEM, and command
* Top N memory consuming processes with %CPU, %MEM, and command


## Starting, Stopping, Enabling, Disabling, Status

To enable on boot: `systemctl enable simple-process-monitor`

To disable on boot: `systemctl disable simple-process-monitor`

To start: `systemctl start simple-process-monitor`

To stop: `systemctl stop simple-process-monitor`

To restart: `systemctl restart simple-process-monitor`

Get Status: `systemctl status simple-process-monitor -l`


## Configuration

All configuration exists within the bash script `simple-process-monitor.sh` towards the top of the script. The installed location is `/simple-process-monitor.sh` so you would need to edit it there after installation. If you change the configuration when the utility is already running, you need to either restart the service or reboot.


