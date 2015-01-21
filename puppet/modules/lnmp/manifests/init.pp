class lnmp(
  $www_root = '/vagrant/app',
  $www_user = 'www-data',
  $hostname = 'localhost',
  $dbname = 'lnmp',
  $dbuser = 'lnmp',
  $dbpass = 'lnmp',
) {
  Exec {
    path => "/usr/bin",
  }

  exec { "apt-get update": }

  class { "lnmp::setup":
    require  => Exec["apt-get update"]
  }

  class { "lnmp::mysql":
    dbname => $dbname,
    dbuser => $dbuser,
    dbpass => $dbpass,
    require  => Exec["apt-get update"]
  }

  class { "lnmp::nginx":
    www_root => $www_root,
    hostname => $hostname,
    require => Exec["apt-get update"]
  }

  class { "lnmp::php":
    www_user => $www_user,
    require => Exec["apt-get update"]
  }
}
