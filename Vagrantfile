# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# The local http port, change this for each guest.
IP = "10.11.12.13"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64"
  config.vm.hostname = "template"
  config.vm.provision "puppet"
  config.vm.network :private_network, ip: IP
  config.vm.synced_folder "app/", "/var/www/html", nfs: true
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.vm.provision "shell", inline: "echo Ready to serve pages at: http://#{IP}"
  config.vm.provision "shell", inline: "echo A local mysql database named app is available, manage it with phpMyAdmin on http://#{IP}/phpMyAdmin."
end
