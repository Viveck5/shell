#!bin/bash

set -e

user_id=$(id -u)
logs_folder="/var/log/shell"
logs_file="${logs_folder}/${0}"

trap 'echo "Error at $LINENO", command: "$BASH_COMMAND"' ERR

if [ $user_id -ne 0]; then
    echo "Please run the script with the sudo access."
    exit 1
fi

mkdir -p $logs_folder

echo "Script started execution at $(date +"%F %T")" &>> logs_file

for package in $@
do
    dnf list installed $package &>> $logs_file
    if [ $? -ne 0 ]; then
        echo "Going to install ${package}"
        dnf install ${package} -y
    else
        echo "${package} already exist... SKIPPING"
    fi
done            

echo "Script started execution at $(date +"%F %T")" &>> $logs_file

