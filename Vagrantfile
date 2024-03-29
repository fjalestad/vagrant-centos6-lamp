# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

HTTP_PORT = 4567

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.box = "puppetlabs/centos-6.5-64-puppet"
	config.vm.hostname = "centos6"
	config.vm.network "forwarded_port", guest: 80, host: HTTP_PORT
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
	end
	config.vm.provision "puppet"
	config.vm.provision "shell", inline: "echo phpMyAdmin is at: http://localhost:#{HTTP_PORT}/phpMyAdmin"
	config.vm.provision "shell", inline: "echo Ready to serve pages in html/ at: http://localhost:#{HTTP_PORT}"
end
