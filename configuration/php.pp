class { "php":
  version => "5.3.3-7+squeeze17",
  source_dir => '/configuration/php/',
  source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
}

php::module { "mysql": }
php::module { "mcrypt": }
php::module { "gd": }
php::module { "curl": }

php::pear::module { "Zend":
  repository  => "zend.googlecode.com/svn",
  use_package => "no",
}

php::pecl::module { 'xdebug':
  use_package => "no",
}
