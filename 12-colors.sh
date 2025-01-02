#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"


VALIDATE() {

if [ $1 -ne 0 ]
    then
        echo -e "$2 ...$R FAILURE"
        exit 1
    else
        echo -e "$2 ...$G SUCCESS"
    fi

}

if [ $? -ne 0 ]
then
    dnf install mysql -y

    VALIDATE $? "Installing mysql"
else
    echo -e "MySQL is already ...$Y INSTALLED"
fi


if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
    
else
    echo -e "Git is already ...$Y INSTALLED"
fi
