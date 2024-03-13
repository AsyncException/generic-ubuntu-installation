#!/bin/sh
#install by using sh -c "$(curl -fsSL https://raw.githubusercontent.com/AsyncException/generic-ubuntu-installation/main/generic-ubuntu-installation.sh)"

#update system
sudo apt update
sudo apt upgrade -y

#install curl
installcount=$(apt list curl --installed | grep curl --count)
if [ "$installcount" -eq 0 ]; then
    sudo apt install curl -y
fi

#install git
installcount=$(apt list git --installed | grep git --count)
if [ "$installcount" -eq 0 ]; then
    sudo apt install git -y
fi

clear

#installing zsh and make it the default shell
installcount=$(apt list zsh --installed | grep zsh --count)
if [ "$installcount" -eq 0 ]; then
    sudo apt install zsh -y
fi

clear

#add user and add it to sudo group
echo "enter username"
read USER

sudo adduser $USER --gecos "" --shell /usr/bin/zsh
sudo adduser $USER sudo

clear

#Install Oh my zsh and download the correct config
cd "/home/${USER}"
export RUNZSH="no"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp -r ~/.oh-my-zsh "/home/${USER}/.oh-my-zsh"
curl -O https://raw.githubusercontent.com/AsyncException/generic-ubuntu-installation/main/.zshrc

#disable root
sudo passwd -l root

exit