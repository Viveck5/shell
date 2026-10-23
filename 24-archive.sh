#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

source_dir=$1
dest_dir=$2
days=${3:-14}

usage(){
    echo -e "${R}USAGE:: ${0} [SOURCE_DIR] [DEST_DIR] [days (Optional, default to 14 days)]${N}"
    exit 1
}

if [ -z "$source_dir" ] || [ -z "$dest_dir" ]; then
    echo "Either source or destination directory is missing"
    usage
fi    

if [ ! -d "$source_dir" ]; then
    echo "Source directory: $source_dir does not exist"
    exit 1
fi

if [ ! -d "$dest_dir" ]; then
    echo "Destination directory: $dest_dir does not exist"
    exit 1
fi    

echo "Scanning files older than $days in $source_dir"
files_to_archive=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_archive" ]; then
    echo "No log files found older than $days days"
    exit 0
fi    

time_stamp=$(date +%Y-%M-%D-%H-%M-%S) 
file_name="$dest_dir/logs-$timestamp.tar.gz"
tar -czf $file_name $files_to_archive

if [ $? -ne 0 ]; then
    echo "Logs archival failed"
    exit 1
else 
    echo "Logs archived: $file_name"
    while IFS= read -r line
    do
        echo "File is going to be deleted: $line"
        rm -rf $line
        echo "File deleted: $line"
    done <<< "$files_to_archive"

fi   






