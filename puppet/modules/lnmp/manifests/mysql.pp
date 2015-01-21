class lnmp::mysql(
  $dbname = 'lnmp',
  $dbuser = 'lnmp',
  $dbpass = 'lnmp',
) {
  package { [
    "mysql-server",
    "php5-mysql",
  ]: }

  exec { "mysql_install_db":
    unless  => "test -d /var/lib/mysql",
    require => Package["mysql-server"],
  }
  exec { "create_db":
    command => "mysql -u root -e 'CREATE DATABASE $dbname;'",
    unless  => "mysql -u root $dbname -e 'SELECT 1;'",
    require => Exec["mysql_install_db"],
  }
  exec { "create_user":
    command => "mysql -u root -e \"
      FLUSH PRIVILEGES;
      CREATE USER '$dbuser'@'localhost' IDENTIFIED BY '$dbpass';
      GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'localhost';
      CREATE USER '$dbuser'@'%' IDENTIFIED BY '$dbpass';
      GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'%';
      \"",
    unless  => "mysql -u $dbuser --password=$dbpass $dbname -e 'SELECT 1;'",
    require => Exec["create_db"],
  }
}
