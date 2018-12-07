#!/bin/sh
####################################
#
# Backup to NFS mount script.
#
####################################

# What to backup. 
backup_files="/home/siebel/Server /var/www"

# Where to backup to.
dest="ftp://dynamicdesignz@dynamicdesignz.net/siebel.server.backup"

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.zip"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest
