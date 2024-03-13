#!/bin/sh
#install by using sh -c "$(curl -fsSL https://raw.githubusercontent.com/AsyncException/generic-ubuntu-installation/main/generic-ubuntu-installation.sh?token=GHSAT0AAAAAACNR5375R3GXXOEDJGCWFB7UZPR2HYQ)"

#update system
sudo apt update
sudo apt upgrade -y

#install git
sudo apt install git -y

clear

#installing zsh and make it the default shell
sudo apt install zsh -y
chsh -s $(which zsh)

clear

#add user and add it to sudo group
sudo adduser async --gecos "" -s /usr/bin/zsh
sudo adduser async sudo

clear

#Install Oh my zsh and download the correct config
cd /home/async
export RUNZSH="no"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp -r ~/.oh-my-zsh /home/async/.oh-my-zsh
curl -O https://raw.githubusercontent.com/AsyncException/generic-ubuntu-installation/main/.zshrc

#disable root
sudo passwd -l root