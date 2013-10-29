/* file { 'my.cnf': */
/*   path    => '/root/.my.cnf', */
/*   ensure  => present, */
/*   mode    => 0640, */
/*   content => "[client] */
/*   user=root */
/*   pass=root", */
/* } */

class { '::mysql::server':
  root_password => 'root',
  old_root_password => 'root',
  override_options => {
      'mysqld' => { 'max_connections' => '1024' },
    }
}

define create_database {
  $db = split($name, ',')
  $db_name = rstrip($db[0])
  $db_user_password = rstrip($db[1])

  mysql::db { $db_name:
    user         => $db_user_password,
    password     => $db_user_password,
    host         => 'localhost',
    grant        => ['all'],
  }
}

if $dbs {
  $dbs_array = split($dbs, ' ')
  create_database{ $dbs_array: }
}

