Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
File { owner => 501, group => 80, mode => 0644 }

stage { 'first': }
stage { 'last': }

Stage['first'] -> Stage['main'] -> Stage['last']

import 'basic.pp'

import '../../configuration/apache.pp'
import '../../configuration/mysql.pp'
import '../../configuration/php.pp'
import '../../configuration/phpmyadmin.pp'

class{ 'basic':
  stage => first
}
