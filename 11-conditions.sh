#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with sudo access"
    exit 1
fi

echo "Proceeding..."

dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "Nginx installation failed"
else
    echo "Nginx installation successfull"
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "Mysql installation failed"
else
    echo "Mysql installation successfull"
 fi

 echo "Proceeded."   
