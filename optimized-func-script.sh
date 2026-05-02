#!bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ] then
	echo "Run the script as a root user"
	exit 1  	# failure is other tjhan 0	
fi
	
VALIDATE() {
    if [ $1 -ne 0 ] then
	    echo "Error: $2 installaing is failure"
	    exit 1  	# failure is other tjhan 0	
    else 
	    echo "$2 installation is success" 
fi 
}

dnf install mysql -y
VALIDATE $? "mysql" 
 

dnf install nginx -y
VALIDATE $? "nginx" 


# $? fecth the last exit code 
