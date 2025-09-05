#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
sudo apt update

packages=('docker' 'docker-compose' 'python3' 'django')

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

python3 --version
docker --version
docker-compose --version
python3 -m django --version