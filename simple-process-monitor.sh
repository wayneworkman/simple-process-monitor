#!/bin/bash

# This will append the Top N most CPU hungry processes to the log file every N seconds.


## Settings:
top_n_processes=10
log_file=/var/log/simple-process-monitor/simple-process-monitor.log # NOTE: This must align to the filename set in the logrotate configuration.
every_n_seconds=3


# Get absolute paths for the commands used.
date=$(command -v date)
echo=$(command -v echo)
cut=$(command -v cut)
ps=$(command -v ps)
head=$(command -v head)
sleep=$(command -v sleep)
mkdir=$(command -v mkdir)
dirname=$(command -v dirname)


# Make sure the destination log directory exists.
log_directory=$($dirname $log_file)
$mkdir $log_directory > /dev/null 2>&1


# the core of this project. Get the CPU and memory stats for the top processes, and send it to a log file.
while true; do 
    $date >> $log_file
    $ps -e -o pcpu,pmem,args --sort=-pcpu | $cut -d" " -f1-5 | $head -n $top_n_processes >> $log_file
    $echo "" >> $log_file
    $sleep $every_n_seconds
done
