#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo apt update

packages=('docker' 'docker-compose' 'python3')

for package in "${packages[@]}"
do
    if sudo dpkg -l | grep $package > /dev/null 2>&1
    then
        echo "$package already exists!"
    else
        echo "Installing $package!"
        sudo apt install -y $package
    fi
done

if python3 -m django --version &> /dev/null
then
    echo "Django already exists!"
else
    echo "Installing Django"
    sudo pip3 install django
fi

python3 --version
docker --version
docker-compose --version
python3 -m django --version