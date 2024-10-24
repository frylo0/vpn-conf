#!/bin/bash

# import { username, password } from './creds.sh'
source ./creds.sh


echo -e "\n\n1) Creating user $username"
if id "$username" &>/dev/null; then
    echo "User $username exists."
else
    echo "User $username does not exist."

	# Create frylo user
	adduser --disabled-password $username
	echo "$username:$password" | sudo chpasswd
	sudo usermod -aG sudo $username
fi


echo -e "\n\n2) Update .bashrc"
if grep -Fxq 'source ~/vpn/api.sh' /home/$username/.bashrc; then
    echo "The line 'source ~/vpn/api.sh' exists in .bashrc."
else
    echo "The line 'source ~/vpn/api.sh' does NOT EXIST in .bashrc."
	echo -e '\n\n# Using custom commands\nsource ~/vpn/api.sh\n' >> /home/$username/.bashrc
fi


echo -e "\n\n3) Install Docker"
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Installing Docker..."

	curl -sSL https://get.docker.com | sh
	sudo usermod -aG docker $username

    echo "Docker has been installed successfully."
else
    echo "Docker is already installed."
fi


echo -e "\n\n4) Install deps"
if ! command -v nginx &> /dev/null; then
    echo "Deps are not installed. Installing deps..."

	sudo apt install nginx git php8.1-fpm -y

	# Prepare Nginx
	sudo ln -s /etc/nginx/sites-available/vpn_frylo_org.conf /etc/nginx/sites-enabled/
	sudo nginx -t
	sudo systemctl reload nginx
else
    echo "Deps is already installed."
fi


echo -e "\n\n5) Install PPTP"
if ! command -v pptpd &> /dev/null; then
    echo "PPTP is not installed. Installing PPTP..."
	echo ""

	cat /home/$username/vpn/tutorials/pptp-config-script-tutor.md

	echo ""

	git clone --depth=1 https://github.com/bedefaced/vpn-install.git /home/$username/vpn/pptp-install
	sudo chmod u+rwx -R /home/$username/vpn/pptp-install
	sudo /home/$username/vpn/pptp-install/pptp/install.sh
else
    echo "PPTP is already installed."
fi

