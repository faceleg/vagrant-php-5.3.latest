# This assumes php5 and mysql-server are installed somewhere else in the puppet manifests.
package { phpmyadmin:
  ensure => installed,
  require => Package['php5', 'mysql-server']
}

# Enable access via /phpmyadmin
# This assumes apache is installed somewhere else in the Puppet manifests
file { '/etc/apache2/sites-enabled/phpmyadmin.conf':
  ensure  => 'present',
  content => 'include /etc/phpmyadmin/apache.conf',
  mode    =>  644,
  require => [
    Class['apache::mod::php'],
    Package['phpmyadmin']
  ]
}
