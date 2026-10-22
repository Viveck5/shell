#!/bin/bash

user_id=$(id -u)
logs_folder="/var/logs/shell"
logs_file="${logs_folder}/${0}.log"

if [ $user -ne 0 ]; then
    echo "Please run the script with the sudo access"
    exit 1
fi

mkdir -p $logs_folder

echo "Script started execution at $(date "+%F +%T")" &>> logs_file

validate(){
    if [ $1 -ne 0 ]; then
        echo "$2 installation failed" | tee -a log_file
        exit 1
    else
        echo "$2 installation success" | tee -a log_file    

    fi
}

dnf install nginx -y &>> log_file
validate $? "nginx"

dnf install mysql -y &>> log_file
validate $? "mysql"

echo "Installation script execution completed at $(date "+%F +%T")" &>> log_file
