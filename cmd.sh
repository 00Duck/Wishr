#!/bin/bash

cmdSock="sockets/cmd.sock"

passwordReset () {
    echo -n "Enter username: "
    read -r username
    if [ -z $username ]; then
        echo "Username cannot be empty."
        readNext
    fi
    echo "Enter new password:"
    read -s password1
    if [ -z $password1 ]; then
        echo "Password cannot be empty."
        readNext
    fi
    echo "Confirm new password:"
    read -s password2
    if [ -z $password2 ]; then
        echo "Password cannot be empty."
        readNext
    fi

    if [ $password1 != $password2 ]; then
        echo "Passwords did not match - please try again"
        readNext
    fi
    echo "Connecting to server..."
    echo "pwrc $username $password1" | sudo nc -U $cmdSock
}

readNext () {
    echo -n "wishr> "
    read -r line

    if [[ $line = ls* ]]; then
        echo "$line" | sudo nc -U $cmdSock
        readNext
    fi

    case $line in
        "")
            readNext
            ;;
        "exit")
            exit 0
            ;;
        "passwordreset")
            passwordReset
            ;;
        "help")
            echo -e "\nCommand list:
        help \t\t shows this command
        passwordreset \t runs the password reset utility.
        ls users \t Prints the list of users from the database. Format userid:id:fullname
        ls wishlists \t Prints the list of wishlists from the database. Format name:id:ownername
            "
            ;;
        *)
            echo "Invalid command - type 'help' for options."
            ;;
    esac
    readNext
}

if [ ! -e "$cmdSock" ]; then
    echo "Could not start CLI - no socket found."
    exit 1
fi

readNext