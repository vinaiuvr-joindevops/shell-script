#!/bin/bash

USERID=$(id -u)

VALIDATE() {

if [ $1 -ne 0 ]
    then
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi

}

if [ $? -ne 0 ]
then
    dnf install mysql -y

    VALIDATE $? "Installing mysql"
else
    echo "MySQL is already ... INSTALLED"
fi


if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
    
else
    echo "Git is already ... INSTALLED"
fi
