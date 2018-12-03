#!/usr/bin/env bash

if [ ! -f ~/.zshrc ]; then
  echo "-------------------------------"
  echo "INSTALL ZSH & ENABLE"
  echo "-------------------------------"
  sudo apt-get update
  sudo apt-get install -y zsh
  echo "exec zsh" >> ~/.bashrc
  sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "-------------------------------"
  echo "ZSH is already install"
  echo "-------------------------------"
fi