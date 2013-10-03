rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum -y install httpd php-pecl-apc php-mysql mysql-server php-cli php-gd php php-mbstring php-xml php-intl php-mcrypt php-pecl-xdebug
cp /vagrant/app.conf /etc/httpd/conf.d/
echo "memory_limit = 256M" >> /etc/php.ini
echo "xdebug.default_enable=1" >> /etc/php.ini
echo "xdebug.remote_enable=1" >> /etc/php.ini
echo "xdebug.remote_handler=dbgp" >> /etc/php.ini
echo "xdebug.remote_host=10.0.2.2" >> /etc/php.ini
echo "xdebug.remote_port=9000" >> /etc/php.ini
echo "date.timezone = America/New_York" >> /etc/php.ini
chkconfig --levels 235 iptables off
chkconfig --levels 235 httpd on
chkconfig --levels 235 mysqld on
service iptables stop
service mysqld start
service httpd start
mysql -u root -e "create database app";
mysql -u root < /vagrant/phpMyAdmin/examples/create_tables.sql
echo "Ready to serve pages on http://localhost:4568/app." 
echo "A local mysql database named app is available,"
echo "manage it with phpMyAdmin on http://localhost:4568/phpMyAdmin."