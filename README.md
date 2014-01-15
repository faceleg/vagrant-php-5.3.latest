# Vagrant PHP 5.3.latest

Debian 6 Vagrant box for PHP 5.3.latest, includes MySQL, Apache and various commonly used PHP extensions.

Automatically creates DB & Virtual Hosts as specified in `user/*` files. See `user_examples/*` for more details.


# How to Install

 - Clone this repository to your machine
 - Download & install Vagrant: http://www.vagrantup.com/downloads.html
 - Install [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater)
 
   `vagrant plugin install vagrant-hostsupdater`
 - Copy the contents of `/user_examples` to `/user`. Modify them as required
 - `cd` to the directory you cloned this repository to, execute:

   `vagrant up`

 - Wait
