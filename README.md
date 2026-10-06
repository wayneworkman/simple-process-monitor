# Simple Process Monitor

Created by [Wayne Workman](https://github.com/wayneworkman)

[![Blog](https://img.shields.io/badge/Blog-wayne.theworkmans.us-blue)](https://wayne.theworkmans.us/)
[![GitHub](https://img.shields.io/badge/GitHub-wayneworkman-181717?logo=github)](https://github.com/wayneworkman)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Wayne_Workman-0077B5?logo=linkedin)](https://www.linkedin.com/in/wayne-workman-a8b37b353/)
[![SpinnyLights](https://img.shields.io/badge/SpinnyLights-wayneworkman-764ba2)](https://spinnylights.com/wayneworkman)

This Terraform module deploys an AWS Lambda function that uses Amazon Bedrock to detect prompt injection attempts in user input. The module implements the security principles outlined in [this hands-on demo](https://wayne.theworkmans.us/posts/2025/10/2025-10-18-prompt-injection-hands-on-demo.html).


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

A logrotate configuration is setup to rotate the `*.log` files within `/var/log/simple-process-monitor/` on a weekly basis, if the files reach 10M in size.

If you installed version 1.0.0, its logrotate configuration also matched already-rotated files and eventually caused logrotate to fail with "File name too long". To fix an existing install, copy the new `logrotate.conf` to `/etc/logrotate.d/simple-process-monitor.conf`, then delete the rotated files with very long names from `/var/log/simple-process-monitor/`.

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


