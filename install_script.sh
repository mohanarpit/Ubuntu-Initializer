#!/bin/bash

#Install Chrome
sudo apt-get install -y libxss1 &&  
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i google-chrome*.deb
rm google-chrome*.deb 
sudo apt-get update &&
sudo apt-get install libappindicator1 libappindicator7 google-chrome-stable

#sudo apt-get -qq update
DEBIAN_FRONTEND=noninteractive sudo apt-get install -qq -y s3cmd php5 libapache2-mod-php5 php5-cli php5-mysql \
php5-mcrypt php5-curl php-pear curl git sqlite php5-sqlite php5-json git-flow python-mysqldb subversion ant maven

#Configure Git
echo "Input your Git user.name"
read GIT_USER_NAME
echo "Input your Git user.email"
read GIT_USER_EMAIL

# Install PHPUnit
sudo pear upgrade-all
sudo pear config-set auto_discover 1
sudo pear install -f --alldeps pear.phpunit.de/PHPUnit

# Install Composer
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

#Install Java
sudo apt-get install default-jdk default-jdk-doc default-jre default-jre-headless tomcat7 tomcat7-admin -y &&
update-alternatives --display java

#Install Mysql server and client
sudo apt-get install -y mysql-server

#Install MongoDB
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list &&
sudo apt-get update &&
sudo apt-get install mongodb-10gen

#Install Sublime
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt-get update
sudo apt-get install sublime-text-installer

#Create private-public keypair if doesn't already exist
if [ ! -f ~/.ssh/id_rsa ]; 
	then ssh-keygen -t rsa ; 
fi

git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL

#Create a projects folder in the user's home directory. This is where all the projects will be cloned
mkdir -p ~/projects/
mkdir -p ~/.ec2/
mkdir -p ~/projects/vagrant

cd ~/projects/vagrant (
		wget http://files.vagrantup.com/packages/a40522f5fabccb9ddabad03d836e120ff5d14093/vagrant_1.3.5_x86_64.deb
		sudo apt-get install virtualbox dkms virtualbox-guest-additions-iso -y
		sudo dpkg -i vagrant_1.3.5_x86_64.deb
		rm vagrant_1.3.5_x86_64.deb
	)

#Install utilities 
sudo apt-get install git-flow
sudo apt-get install autojump
