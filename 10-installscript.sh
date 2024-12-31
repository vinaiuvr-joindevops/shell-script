#! /bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR :: you must have sudo access to execute this script"
    exit 1 #other than 0
fi

dnf list installed mysql 

if [$? -ne 0]  #not installed
then 
    dnf install mysql -y

    if [$? -ne 0]
       echo "Installing Mysql...failure"
       exit 1
    else
        echo "Installing MYsql ..success"
    fi
else
     echo "Mysql is already installed"

fi

dnf list installed git 

if [$? -ne 0]  #not installed
then 
    dnf install git -y

    if [$? -ne 0]  #not installed
    then 
        echo "Installing git...failure"
        exit 1
    else
        echo "Installing git ..success"
    fi
else
    echo "git is already installed"

fi