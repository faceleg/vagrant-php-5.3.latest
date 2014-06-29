#!/bin/sh

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR='/vagrant/puppet'

# NB: librarian-puppet might need git installed. If it is not already installed
# in your basebox, this will manually install it at this point using apt or yum

apt-get update
apt-get upgrade -y
apt-get -q -y install git

if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
 gem install librarian-puppet
 cd $PUPPET_DIR && librarian-puppet install --clean
else
 cd $PUPPET_DIR && librarian-puppet update
fi

sudo -E puppet apply -vv --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/main.pp
