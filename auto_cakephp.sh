sudo yum -y install httpd

sudo service httpd start

sudo chkconfig httpd on

sudo service iptables stop

sudo chkconfig iptables off

sudo yum -y install mysql-server

sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm

sudo yum -y install mysql mysql-devel mysql-server mysql-utilities

sudo yum -y install php

sudo rm -rf /var/www/html

sudo ln -fs /vagrant /var/www/html

sudo /etc/init.d/mysqld start

sudo yum -y install php-mysql

sed -i -e 's/  # config.vm.network "private_network", ip: "192.168.33.10"/    config.vm.network \"private_network", ip: \"192.168.33.10"/g' /vagrant/Vagrantfile

sudo sed -i -e "s/DirectoryIndex index.html index.html.var/DirectoryIndex index.php index.html index.html.var/g" /etc/httpd/conf/httpd.conf

sudo sed -i -e "s/AllowOverride None/AllowOverride All/g" /etc/httpd/conf/httpd.conf

sudo sed -i -e 's/DocumentRoot "\/var\/www\/html"/DocumentRoot "\/vagrant\/cakephp"/g' /etc/httpd/conf/httpd.conf

sudo sed -i -e 's/;default_charset = "iso-8859-1"/default_charset = "UTF-8"/g' /etc/php.ini

sudo sed -i -e "s/;mbstring.language = Japanese/mbstring.language = Japanese /g" /etc/php.ini

sudo sed -i -e "s/;mbstring.internal_encoding = EUC-JP/mbstring.internal_encoding = UTF-8/g" /etc/php.ini

sudo sed -i -e "s/;mbstring.http_input = auto/mbstring.http_input = pass/g" /etc/php.ini

sudo sed -i -e "s/;mbstring.http_output = SJIS/mbstring.http_output = pass/g" /etc/php.ini

sudo sed -i -e "s/;mbstring.http_input = auto/mbstring.http_input = pass/g" /etc/php.ini

sudo sed -i -e "s/;mbstring.encoding_translation = Off/mbstring.encoding_translation = Off/g" /etc/php.ini

sudo sed -i -e "s/;mbstring.detect_order = auto/mbstring.detect_order = auto/g" /etc/php.ini

sudo sed -i -e "s/;date.timezone =/date.timezone = Asia\/Tokyo/g" /etc/php.ini

cp -p /vagrant/cakephp/app/Config/database.php.default /vagrant/cakephp/app/Config/database.php

sed -i -e "s/Configure::write('Security.salt', '.*');/ Configure::write('Security.salt', 'password');/g" /vagrant/cakephp/app/Config/core.php

sed -i -e "s/Configure::write('Security.cipherSeed', '.*');/ Configure::write('Security.cipherSeed', '0123456789');/g" /vagrant/cakephp/app/Config/core.php

sed -i -e "/'duration' => $duration/a\        'mask' => 0666" /vagrant/cakephp/app/Config/core.php

sed -i -e "/'duration' => \$duration/s/$/,/g" /vagrant/cakephp/app/Config/core.php

mysql -u root -e "create database dotinstall_cakephp_blog DEFAULT CHARACTER SET utf8mb4;grant all on dotinstall_cakephp_blog.* to dbuser@localhost identified by 'password_new';"

sed -i -e "1,/'login' => 'user'/s/'login' => 'user'/'login' => 'dbuser'/" /vagrant/cakephp/app/Config/database.php

sed -i -e "1,/'database' => 'database_name'/s/'database' => 'database_name'/'database' => 'dotinstall_cakephp_blog'/" /vagrant/cakephp/app/Config/database.php

sed -i -e "1,/\/\/'encoding' => 'utf8'/s/\/\/'encoding' => 'utf8'/'encoding' => 'utf8'/" /vagrant/cakephp/app/Config/database.php

sed -i -e "1,/'password' => 'password'/s/'password' => 'password'/'password' => 'password_new'/" /vagrant/cakephp/app/Config/database.php
