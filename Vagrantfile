# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64"
  #config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision "puppet"
  config.vm.network :forwarded_port, host: 8080, guest: 80, auto_correct: true
  config.vm.synced_folder "app/", "/var/www/html/app"
  config.vm.synced_folder "phpMyAdmin/", "/var/www/html/phpMyAdmin"
  config.vm.hostname = "hostname"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.vm.provision "shell", inline: "echo http://localhost:{forwarded_port}/app"
  config.vm.provision "shell", inline: "echo A local mysql database named app is available, manage it with phpMyAdmin on http://localhost:{forwarded_port}/phpMyAdmin."
end
