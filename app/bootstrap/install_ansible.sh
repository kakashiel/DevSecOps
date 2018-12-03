#!/usr/bin/env bash

if [ ! -x "$(command -v ansible)" ]; then
  echo "-------------------------------"
  echo "Install ANSIVLE"
  echo "-------------------------------"
  sudo apt-get update
  sudo apt-get install -y ansible
else
  echo "-------------------------------"
  echo "ANSIBLE is already install"
  echo "-------------------------------"
fi

echo "Config ansible ..."
sudo mkdir -pv /etc/ansible
sudo cp -v ./my_hosts /etc/ansible
cp -v ./.ansible.cfg $HOME
echo "Config ansible [OK]"