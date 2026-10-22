#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Please run the script with sudo access"
    exit 1
fi

echo "Proceeding..."

validate(){
    if [ $1 -ne 0 ]; then
    echo " $2 installation failed"
else
    echo "$2 installation successfull"
fi
}


dnf install nginx -y
validate $? "Nginx"


dnf install mysql -y
validate $? "Mysql"

