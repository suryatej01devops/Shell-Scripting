#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
	echo -e "$R Run the script as a root user $N"
	exit 1  	# failure is other thhan 0	
fi
	
VALIDATE() {
    if [ $1 -ne 0 ]; then
	    echo -e "$R Error: $2 installaing is failure $N"
	    exit 1  	# failure is other tjhan 0	
    else 
	    echo -e "$G $2 installation is success $N" 
    fi 
}


dnf list installed  mysql
if [ $? ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "mysql" 
else
    echo -e "Mysql is already exit ... $G SKIPPING $N"
fi
 
dnf install nginx -y
if [ $? ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx" 
else
    echo -e "Nginx is already exit ... $G SKIPPING $N"
fi


# $? fecth the last exit code 
