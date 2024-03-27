#!/bin/bash

# This will append the Top N most CPU hungry processes to the log file every N seconds.

top_n_processes=20
log_file=/var/log/simple-process-monitor.log
every_n_seconds=15

date=$(command -v date)
echo=$(command -v echo)
cut=$(command -v cut)
ps=$(command -v ps)
head=$(command -v head)
sleep=$(command -v sleep)

while true; do 
    $date >> $log_file
    $ps -e -o pcpu,pmem,args --sort=-pcpu | $cut -d" " -f1-5 | $head -n $top_n_processes >> $log_file
    $echo "" >> ps.log
    $sleep $every_n_seconds
done
