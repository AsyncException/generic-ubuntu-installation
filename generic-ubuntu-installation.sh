#!/bin/sh
#install by using sh -c "$(curl -fsSL https://github.com/AsyncException/generic-ubuntu-installation/blob/main/generic-ubuntu-installation.sh)"

#update system
sudo apt update
sudo apt upgrade

#install git
sudo apt install git

#installing zsh and make it the default shell
sudo apt install zsh
chsh -s $(which zsh)

#Install Oh my zsh and download the correct config
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -O https://github.com/AsyncException/generic-ubuntu-installation/blob/main/.zshrc

#add user and add it to sudo group
sudo adduser async
sudo adduser async sudo