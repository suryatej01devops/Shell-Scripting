#!bin/bash

USERID=$(id -u)

if [$USERID -ne 0] then
	echo "Run the script as a root user"
	exit 1  	# failure is other tjhan 0	
fi
	

dnf install mysql -y
 
if [$? -ne 0] then
	echo "Error: my sql installaing is failure"
	exit 1  	# failure is other tjhan 0	
else 
	echo "mysql installation is success" 

fi

dnf install nginx -y
 
if [$? -ne 0] then
	echo "Error: my nginx installaing is failure"
	exit 1  	# failure is other than 0	
else 
	echo "nginx installation is success" 

fi 

# $? fecth the last exit code 
