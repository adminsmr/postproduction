#!/bin/sh
#
# This script remove ALL FILES older 90 days in /mnt/storage/projects
#

timestamp=$(date +%Y%m%d_%H%M%S)
path="/mnt/storage/projects/"
filename=log_delolder90day_$timestamp.txt
log=$path/$filename

#find $path -mtime +90 -type f -print -delete >> $log

echo "Delete:: Script Start -- $(date +%Y%m%d_%H%M)" >> $log
START_TIME=$(date +%s)

find $path -mtime +90 -type f -print -delete >> $log

END_TIME=$(date +%s)
ELAPSED_TIME=$(expr $END_TIME - $START_TIME)
echo "Delete :: Script End -- $(date +%Y%m%d_%H%M)" >> $log
echo "Elapsed Time ::  $(date -d $ELAPSED_TIME +%Hh:%Mm:%Ss) "  >> $log

#exit 0
