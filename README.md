vagrant-centos64-lamp
=====================

A CentOS vagrant guest designed to match the IAS production
servers.


What is this exactly?
=====================

This is a development platform for PHP on CentOS 6. It contains
a configured phpMyAdmin for your convenience (user: root,
password: NULL).


Usage
=====

1. Install vagrant and virtualbox.
2. Edit the Vagrantfile and set a unique private IP address and a
   hostname for this VM.
3. Run `vagrant up`.
4. Read the output from `vagrant up` on where to put your files
   and where to point your browser.
