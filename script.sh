#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Run the script as a root user"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error: mysql installation failed"
    exit 1
else
    echo "mysql installation is success"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Error: nginx installation failed"
    exit 1
else
    echo "nginx installation is success"
fi