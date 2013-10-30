# -*- mode: ruby -*-
# vi: set ft=ruby :

# Install vagrant-list for the ability to list running vagrant boxes
# https://github.com/joshmcarthur/vagrant-list
# vagrant plugin install vagrant-list

# Install hostmaster to automatically add hosts entries
# https://github.com/mosaicxm/vagrant-hostmaster
# vagrant plugin install vagrant-hostmaster

Vagrant::configure("2") do |config|
  config.vm.box = "Debian"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-607-x64-vbox4210.box"

  load File.expand_path("./user/directories.pp")
  config.vm.synced_folder $projects, "/srv/www/", :nfs => true
  config.vm.synced_folder "./configuration/", "/configuration/", :nfs => true

  config.vm.network :private_network, ip: "192.168.50.4"

  config.vm.hostname = "www.bpb-vagrant.dev"

  load File.expand_path("./user/vhosts.pp")
  config.hostsupdater.aliases = $vhosts.keys

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize [
      "modifyvm", :id,
      "--memory", "512",
      "--name", "bpb-php-53"
    ]
  end

  # Prepare facts
  $facts = "export FACTER_vhosts=\""
  $vhosts.each do |name, directory|
    $facts += name + "\",\"" + directory + " "
  end
  $facts += "\";\n"

  load File.expand_path("../user/dbs.pp", __FILE__)
  $facts += "export FACTER_dbs=\""
  $dbs.each do |name, username_password|
    $facts += name + "," + username_password + " "
  end
  $facts += "\";\n"

  $bootstrap = File.read("./shell/bootstrap.sh")

  config.vm.provision :shell, :inline => $facts + $bootstrap;
end

