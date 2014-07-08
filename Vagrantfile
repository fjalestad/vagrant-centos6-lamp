# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

HTTP_PORT = 8081

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "centos-6.4"
	config.vm.hostname = "centos6"
	config.vm.provision "puppet"
	config.vm.network "forwarded_port", guest: 80, host: HTTP_PORT
	config.vm.synced_folder "html/", "/var/www/html", create: true
	config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"
	config.vm.provider "virtualbox" do |vbox|
		host = RbConfig::CONFIG['host_os']
		# Give VM 1/4 system memory & access to all cpu cores on the host
		if host =~ /darwin/
			cpus = `sysctl -n hw.ncpu`.to_i
			# sysctl returns Bytes and we need to convert to MB
			mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
		elsif host =~ /linux/
			cpus = `nproc`.to_i
			# meminfo shows KB and we need to convert to MB
			mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
		else # sorry Windows folks, I can't help you
			cpus = 2
			mem = 1024
		end
		vbox.customize ["modifyvm", :id, "--memory", mem]
		vbox.customize ["modifyvm", :id, "--cpus", cpus]
		config.vm.provision "shell", path: "vbox_additions.sh"
	end
	config.vm.provision "shell", inline: "yum -y update"
	config.vm.provision "shell", inline: "echo Ready to serve pages in www/ at: http://localhost:#{HTTP_PORT}"
	config.vm.provision "shell", inline: "echo phpMyAdmin is at: http://localhost:#{HTTP_PORT}/phpMyAdmin"
end
