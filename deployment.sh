#!/bin/sh
# deploy  Config script
cd /
clear

echo "--------------------------------------------------------"
echo " Quickup Deployment Script v2                            "
echo "--------------------------------------------------------"

$1 - 
$2 - 
$3 - 
 
# EXAMPLE
# IP = 127.0.0.1
# ServerName = example.com
# Vhostname = could be anything 


#set hostname

#echo -n "Enter Hostname: "
#read name
#echo "$name!" > /etc/hostname
#hostname -f /etc/hostname

#add hostname and ip address to hosts

#echo "#" > /etc/hosts
#echo "127.0.0.1                localhost" >> /etc/hosts
#(hostname -I ; hostname -s ; hostname) | sed ':a;N;$!ba;s/\n/ /g' >> /etc/hosts


#add host in /etc/hosts

echo $1 $2 >> /etc/hosts 
echo ServerName localhost >> /etc/apache2/httpd.conf 

#update time zone

dpkg-reconfigure tzdata

date

# time 
apt-get install ntp -y
update-rc.d ntp enable

#/bin/echo \"%vagrant  ALL=(ALL) ALL\" >> /etc/sudoers

#install git

clear

echo " now installing git "
wait 10

apt-get install git -y

clear

#

echo " now installing .zsh "
wait 10

apt-get install zsh -y

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

cd/

cp ~/.zshrc ~/.zshrc_bak

rm ~/.zshrc -y

sed 's/plugins=(git)/plugins=(git debian node nvm npm ruby rvm)/g' ~/.zshrc_bak > ~/.zshrc

clear

# install Node Version Manager
echo "Installing NVM"

curl https://raw.github.com/creationix/nvm/master/install.sh | sh

nvm install v0.10.20

curl -L https://get.rvm.io | bash -s stable --ruby

source /usr/local/rvm/scripts/rvm

# install via gem

gem install compass breakpoint

#install Grunt

npm install -g grunt-cli

clear

echo "Installing New Relic"
# add new relic monitoring

echo "deb http://apt.newrelic.com/debian/ newrelic non-free" >> //etc/apt/sources.list

wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -

apt-get update

apt-get install newrelic-sysmond

nrsysmond-config --set license_key=

/etc/init.d/newrelic-sysmond start

echo " new relic installed "

wait 10

clear

echo " install Apache and php5"

apt-get install apache2 php5 php5-curl php5-mysql -y

rm /etc/apache2/sites-available/000-default -y

mkdir /var/log/apache2/$3

chown root:adm /var/log/apache2/$3

echo "<VirtualHost *:80>
    ServerName $3.co.uk:80
    DocumentRoot /var/www/$3

    LogLevel warn
    ErrorLog /var/log/apache2/$3/error.log
    CustomLog /var/log/apache2/$3/access.log combined

</VirtualHost>" > /etc/apache2/sites-available/$3


#echo "<VirtualHost *:80>
 #       ServerAdmin $3
  #      ServerName $2
#
 #       DocumentRoot $5$2/public_html/
  #      <Directory />#
  #              Options FollowSymLinks
  #              AllowOverride All
  #      </Directory>
  #      <Directory $5$2/public_html/>
 #               Options Indexes FollowSymLinks MultiViews
 #               AllowOverride All
 #               Order allow,deny
 #               allow from all
 #       </Directory>
#
 #       ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
  #      <Directory "'/usr/lib/cgi-bin'">
   #             AllowOverride All
    #            Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
     #           Order allow,deny
      #          Allow from all
      #  </Directory>

     #   ErrorLog $5$2/error.log

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
      #  LogLevel warn

       # CustomLog $5$2/access.log combined

   # Alias /doc/ "'/usr/share/doc/'"
   # <Directory "'/usr/share/doc/'">
     #   Options Indexes MultiViews FollowSymLinks
      #  AllowOverride All
     #   Order deny,allow
    #    Deny from all
   #     Allow from 127.0.0.0/255.0.0.0 ::1/128
  #  </Directory>

#</VirtualHost>" > /etc/apache2/sites-available/stage 

#add link in /etc/apache2/site-enabled

a2ensite $3

a2enmod rewrite

# reload Apache2

/etc/init.d/apache2 reload

#Firewall
apt-get install ufw - y
# enable the firewall previously installed
ufw enable

# turn on logging
ufw logging on
 
# set log level
ufw logging low
 
# delete all existing rules
ufw status numbered
ufw delete 

# allow ssh port 
ufw allow ssh

# allow http port
ufw allow http
 
# allow https port
ufw allow https

#apt-get install libapache2-mod-evasive libapache-mod-security -y

#mkdir /var/log/apache2/mod_evasive

#chown www-data:www-data /var/log/apache2/mod_evasive/

reboot
