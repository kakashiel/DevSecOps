#!/usr/bin/env bash

if [ ! -x "$(command -v terraform)" ]; then
  echo "-------------------------------"
  echo "Install TERRAFORM"
  echo "-------------------------------"
  wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip
  unzip terraform_0.11.10_linux_amd64.zip
  sudo mv terraform /bin
  rm -rf terraform_0.11.10_linux_amd64.zip
else
  echo "-------------------------------"
  echo "TERRAFORM is already install"
  echo "-------------------------------"
fi