#!/bin/sh
#install by using sh -c "$(curl -fsSL https://raw.githubusercontent.com/AsyncException/generic-ubuntu-installation/main/generic-ubuntu-installation.sh)"

#update system
sudo apt update
sudo apt upgrade -y

#install curl
installcount=$(apt list curl --installed | grep curl --count)
if [ "$installcount" -eq 0 ]; then
    echo -e "\033[33;36m Installing curl"
    sudo apt -qq install curl -y
fi

clear

#install git
installcount=$(apt list git --installed | grep git --count)
if [ "$installcount" -eq 0 ]; then
    echo -e "\033[33;36m Installing git"   
    sudo apt -qq install git -y
fi

clear

#installing zsh and make it the default shell
installcount=$(apt list zsh --installed | grep zsh --count)
if [ "$installcount" -eq 0 ]; then
    echo -e "\033[33;36m Installing zsh"
    sudo apt -qq install zsh -y
fi

clear

#install sshd
installcount=$(apt list openssh-server --installed | grep zsh --count)
if [ "$installcount" -eq 0 ]; then
    echo -e "\033[33;36m Installing zsh"
    sudo apt -qq install openssh-server -y
fi

clear

#add user and add it to sudo group
echo -e "\033[33;36m Creating useraccount"
echo "enter username:"
read USER

sudo adduser $USER --gecos "" --shell /usr/bin/zsh
sudo adduser $USER sudo

clear

#Install Oh my zsh and download the correct config
echo -e "\033[33;36m Installing Oh my zsh"
cd "/home/${USER}"
export RUNZSH="no"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp -r ~/.oh-my-zsh "/home/${USER}/.oh-my-zsh"
curl -O https://raw.githubusercontent.com/AsyncException/generic-ubuntu-installation/main/.zshrc

#disable MOTD
echo -e "\033[33;36m Removing MOTD"
cd /etc/update-motd.d
sudo rm *


#disable root
sudo passwd -l root

