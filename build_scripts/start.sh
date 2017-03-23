#!/bin/bash

export USER_NAME=$1
export USER_ID=$2
export USER_KEY=$3

user_exists=$(id -u $USER_NAME > /dev/null 2>&1; echo $?) 
if [[ "$user_exists" == 0 ]]; then
    echo "sshd started"
    sudo /usr/bin/svscan /services/ 
else
    echo "CONFIG: enabling sudo without password for all users"
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
    echo "CONFIG: configuring daemontools for sshd"
    cd /workarea
    ./setup_sshd
    echo "configuring user: $USER_NAME ..."
    adduser --disabled-password --gecos '' --home /workarea --uid $USER_ID $USER_NAME > /dev/null 2>&1 
    adduser $USER_NAME sudo > /dev/null 2>&1 
    chown $USER_NAME /workarea
    chmod go-w /workarea
    su $USER_NAME -c "./user_configuration.sh \"$USER_KEY\""
fi
