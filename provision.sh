#!/bin/bash
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y install puppet
puppet apply /vagrant/manifests/default.pp