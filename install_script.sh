#!/bin/bash

#Install the wireless drivers
sudo apt update -y
sudo apt install -y bcmwl-kernel-source

#Configure Git
echo "Input your Git user.name"
read GIT_USER_NAME
echo "Input your Git user.email"
read GIT_USER_EMAIL

#Install Chrome
sudo apt install -y  libappindicator1 libindicator7 libpango1.0-0 libpangox-1.0-0
sudo apt install -y libxss1 &&  
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb &&
sudo dpkg -i google-chrome*.deb
rm google-chrome*.deb 
sudo apt update 

#Create the directories
mkdir -p /code/third-party

#sudo apt -qq update
DEBIAN_FRONTEND=noninteractive sudo apt install -qq -y php libapache2-mod-php php-mysql \
php-mcrypt php-curl php-pear curl git git-core sqlite php-sqlite php-json python-mysqldb subversion ant maven golang-go \
build-essential libssl-dev libffi-dev python-dev

git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL

#Install Java
sudo apt install default-jdk default-jdk-doc default-jre default-jre-headless -y &&
update-alternatives --display java

#Install Tomcat server
wget -O /code/third-party/apache-tomcat-8.5.4.tgz http://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.4/bin/apache-tomcat-8.5.4.tar.gz
mkdir -p /code/tomcat/
tar -xvzf /code/third-party/apache-tomcat-8.5.4.tgz -C /code/tomcat --strip-components=1

#Install Apache2 server
sudo apt install -y apache2

#Install Mysql server and client
sudo apt install -y mysql-server

#Install nodejs
sudo apt install -y nodejs npm

#Install Atom 
wget -O /code/third-party/atom-amd64.deb https://atom.io/download/deb
sudo dpkg -i /code/third-party/atom-amd64.deb
sudo apt install -f

#Install Zsh & oh-my-zsh
sudo apt install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

#Install Docker 
sudo apt update
sudo apt install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list'
sudo apt update
sudo apt install -y linux-image-extra-$(uname -r)
sudo apt install -y docker-engine

#Create private-public keypair if doesn't already exist
if [ ! -f ~/.ssh/id_rsa ]; 
	then ssh-keygen -t rsa ; 
fi

#Install utilities 
sudo apt install -y tmux
sudo apt install -y exfat-fuse exfat-utils
sudo apt install -y vim
sudo apt install -y openssh-server fail2ban 
sudo apt install -y jq

#Install Ansible
sudo apt install -y python-pip
sudo pip install paramiko PyYAML Jinja2 httplib2 six ansible
