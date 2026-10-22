#!/bin/bash

user_id=$(id -u)
logs_folder="/var/log/shell"
logs_file="${logs_folder}/${0}.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $user_id -ne 0 ]; then
    echo "Please run the script with the sudo access"
    exit 1
fi

mkdir -p $logs_folder

echo "Script started execution at $(date "+%F +%T")" &>> $logs_file

validate(){
    if [ $1 -ne 0 ]; then
        echo "$2 installation ${R}failed${N}" | tee -a $logs_file
        exit 1
    else
        echo "$2 installation ${G}success${N}" | tee -a $logs_file    

    fi
}
for package in $@
do  
    dnf list installed ${package}
    if [ $? -ne 0 ]; then
        echo "Going to install ${package}"
        dnf install ${package} -y &>> $logs_file
        validate $? ${package}
    else
        echo "${package} already installed... ${Y}SKIPPING${N}" | tee -a $logs_file   
    fi        
done


echo "Installation script execution completed at $(date "+%F +%T")" &>> $logs_file
