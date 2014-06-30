#!/usr/bin/env bash

apt-get update
apt-get upgrade -y
apt-get -q -y install git

# Directory in which librarian-puppet should manage its modules directory
PUPPET_DIR='/vagrant/puppet'

# Install librarian
if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
  gem install librarian-puppet puppet
  cd $PUPPET_DIR && librarian-puppet install --clean
else
  cd $PUPPET_DIR && librarian-puppet update
fi

puppet apply -vv --modulepath=$PUPPET_DIR/modules/ $PUPPET_DIR/manifests/main.pp
