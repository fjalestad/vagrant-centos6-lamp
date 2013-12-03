vagrant-centos64-lamp
=====================

A ready-to-use vagrant template of a Centos 6.4 LAMP server for running
PHP applications like Drupal.

What is this exactly?
=====================
This is a development platform for PHP on CentOS 6.4. It contains
a configured phpMyAdmin for your convenience (user: root,
password: NULL).

Usage
=====
1. Install vagrant and virtualbox.
2. Edit the Vagrantfile and set a unique private IP address and a
   hostname for this VM.
3. Create the app/ directory. Thes contents of this directory will
   served from /var/www/html in the VM.
4. Run `vagrant up`.
5. There will be an NFS error on the first boot. Ignore it and run
   `vagrant provision`, then `vagrant reload`. You have to do this
   only once.
6. Place your application files in app/.
7. Read the output from `vagrant provision` on where to point your
   browser.
8. (Optional) Add /etc/hosts entries pointing at the VM's IP.
