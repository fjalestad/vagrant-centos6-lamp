# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# The local http port, change this for each guest.
HTTP_PORT = 4567

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64"
  config.vm.hostname = "template"
  config.vm.provision "puppet"
  config.vm.network :forwarded_port, host: HTTP_PORT, guest: 80
  config.vm.synced_folder "app/", "/var/www/html/app", :owner=> 'apache', :group=>'apache'
  config.vm.synced_folder "phpMyAdmin/", "/var/www/html/phpMyAdmin"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
  config.vm.provision "shell", inline: "echo Ready to serve pages at: http://localhost:#{HTTP_PORT}"
  config.vm.provision "shell", inline: "echo A local mysql database named app is available, manage it with phpMyAdmin on http://localhost:#{HTTP_PORT}/phpMyAdmin."
end
