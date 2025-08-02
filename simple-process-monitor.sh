#!/bin/bash

# This will append the Top N most CPU and memory hungry processes, plus free memory info to the log file every N seconds.


## Settings:
top_n_processes=10
log_file=/var/log/simple-process-monitor/simple-process-monitor.log # NOTE: this directory has a logrotate configuration.
every_n_seconds=15


# Get absolute paths for the commands used.
date=$(command -v date)
echo=$(command -v echo)
cut=$(command -v cut)
ps=$(command -v ps)
head=$(command -v head)
sleep=$(command -v sleep)
mkdir=$(command -v mkdir)
dirname=$(command -v dirname)
free=$(command -v free)


# Make sure the destination log directory exists.
log_directory=$($dirname $log_file)
$mkdir $log_directory > /dev/null 2>&1


# the core of this project. Get the CPU and memory stats for the top processes, and send it to a log file.
while true; do 
    # Timestamp
    $echo "==================== $($date) ====================" >> $log_file
    
    # Free memory information
    $echo "=== FREE MEMORY ===" >> $log_file
    $free -h >> $log_file
    $echo "" >> $log_file
    
    # Top CPU consuming processes
    $echo "=== TOP $top_n_processes CPU HUNGRY PROCESSES ===" >> $log_file
    $ps -e -o pcpu,pmem,args --sort=-pcpu | $head -n $(($top_n_processes + 1)) >> $log_file
    $echo "" >> $log_file
    
    # Top Memory consuming processes
    $echo "=== TOP $top_n_processes MEMORY HUNGRY PROCESSES ===" >> $log_file
    $ps -e -o pcpu,pmem,args --sort=-pmem | $head -n $(($top_n_processes + 1)) >> $log_file
    $echo "" >> $log_file
    
    $sleep $every_n_seconds
done
