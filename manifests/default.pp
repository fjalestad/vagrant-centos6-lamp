 package { "epel-release-6-8.noarch":
 	provider => "rpm",
 	ensure => installed,
 	source => "http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
 }

$phpbase = [ "httpd", "php-pecl-apc", "php-mysql", "mysql-server", "php-cli", "php-gd", "php", "php-mbstring", "php-xml", "php-intl" ]

package {$phpbase:
 	ensure => installed,
 	notify => Service['httpd'],
}

$phpextra = [ "php-mcrypt", "php-pecl-xdebug" ]
package { $phpextra:
	ensure => installed,
	require => Package["epel-release-6-8.noarch"],
	notify => Service['httpd'],
}

service { "httpd":
	ensure => running,
	require => Package["httpd"],
}

service { "mysqld":
	ensure => running,
	require => Package["mysql-server"],
}

service { "iptables":
	ensure => stopped,
}

file { "/etc/httpd/conf.d/app.conf":
	source => "/vagrant/app.conf",
	notify => Service['httpd'],
	require => Package["httpd"],
}

file { "/etc/php.d/local.ini":
	source => "/vagrant/php_local.ini",
	notify => Service['httpd'],
	require => Package["php"],
}

exec { "appdb":
	command => '/usr/bin/mysql -u root -e "create database app";',
	creates => '/var/lib/mysql/app',
	require => Service["mysqld"],
}

exec { "pmadb":
	command => '/usr/bin/mysql -u root < /vagrant/phpMyAdmin/examples/create_tables.sql',
	creates => '/var/lib/mysql/phpmyadmin',
	require => Service["mysqld"],
}