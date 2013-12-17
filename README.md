Vagrant/Puppet + G4 Code Phaker Demo
====================================

Requires
--------

* [VirtualBox](http://www.virtualbox.org)
* [Vagrant](http://www.vagrantup.com)

Optional
--------

* The [vagrant-vbguest plugin](http://blog.carlossanchez.eu/2012/05/03/automatically-download-and-install-virtualbox-guest-additions-in-vagrant/) is also nice to have


Basic usage
-----------

1. Run 'make' to clone phaker_demo
2. Run 'vagrant up' and wait for VM to be provisioned. It will (probably) first download vagrant box (~500MB) and while building VM will ask you for sudo pass at least one time (for NFS share)
3. Run 'vagrant ssh', then from inside VM go to /var/www/phaker_demo and run 'make'. This will download Composer and install dependencies for project
4. Add '192.168.33.11 dev.phaker.dev' to /etc/hosts
5. Go to http://dev.phaker.dev
6. Enjoy :)


IMPORTANT
---------

Don't use Windows as host machine, it will not work
