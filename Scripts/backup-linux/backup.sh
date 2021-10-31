#!/bin/bash

# Path
backup_files="/home /var /etc /root /boot /opt"
dest="/backup"

# Name
day=$(date +%A)
archive_file="Debain-WEB-${day}.tgz"

# backup
echo "Start backup ${backup_files} to ${dest}/${archive_file}"

tar czf ${dest}/${archive_file} ${backup_files}

echo "Backup finished"

ls -lh ${dest}
