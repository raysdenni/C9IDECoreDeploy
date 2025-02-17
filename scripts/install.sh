#!/bin/bash
chmod +x C9IDECoreDeploy/menu/manage.sh
chmod +x C9IDECoreDeploy/menu/dockermenu.sh
chmod +x C9IDECoreDeploy/menu/managesystemctl.sh
chmod +x C9IDECoreDeploy/menu/managedocker.sh
chmod +x C9IDECoreDeploy/menu/install.sh
chmod +x C9IDECoreDeploy/scripts/c9-maker.sh
chmod +x C9IDECoreDeploy/scripts/ioncubesc.sh
chmod +x C9IDECoreDeploy/scripts/c9-deluser.sh
chmod +x C9IDECoreDeploy/scripts/c9-maker-docker.sh
chmod +x C9IDECoreDeploy/scripts/c9-deluser-docker.sh
chmod +x C9IDECoreDeploy/scripts/c9-status.sh
chmod +x C9IDECoreDeploy/scripts/c9-restart.sh
chmod +x C9IDECoreDeploy/scripts/schedule.sh
chmod +x C9IDECoreDeploy/scripts/firstinstall.sh
chmod +x C9IDECoreDeploy/scripts/c9-maker-dockermemlimit.sh
chmod +x C9IDECoreDeploy/run.sh
sudo apt update -y
sudo apt upgrade -y
sudo apt update -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
source ~/.profile
nvm install node
sudo apt install -y dialog curl at git npm build-essential php php-exif php-gd php-mbstring php-curl php-mysqli php-json php-dom php-fpm python-pip python3-pip python python2.7 python-pyfiglet build-essential zip unzip unp unrar unrar-free unar p7zip dos2unix
pip install requests selenium colorama bs4 wget
systemctl start atd
sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common docker docker.io docker-compose
sudo adduser c9users
sudo wget https://raw.githubusercontent.com/gvoze32/C9IDECoreDeploy/master/misc/dockeryml/docker-compose.yml -O /home/c9users/docker-compose.yml
sudo adduser c9usersmemlimit
sudo wget https://raw.githubusercontent.com/gvoze32/C9IDECoreDeploy/master/misc/dockeryml-memlimit/docker-compose.yml -O /home/c9usersmemlimit/docker-compose.yml
echo "blank" >> /home/c9users/.env
echo "blank" >> /home/c9usersmemlimit/.env
curl -O https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
tar -xvzf ioncube_loaders_lin_x86-64.tar.gz
rm ioncube_loaders_lin_x86-64.tar.gz
cd ioncube
php_ext_dir="$(command php -i | grep extension_dir 2>'/dev/null' \
    | command head -n 1 \
    | command cut --characters=31-38)"
php_version="$(command php --version 2>'/dev/null' \
    | command head -n 1 \
    | command cut --characters=5-7)"
cp ioncube_loader_lin_${php_version}.so /usr/lib/php/${php_ext_dir}
cd ..
rm -rf ioncube
cat > /etc/php/${php_version}/cli/conf.d/00-ioncube-loader.ini << EOF
zend_extension=ioncube_loader_lin_${php_version}.so
EOF
php -v
