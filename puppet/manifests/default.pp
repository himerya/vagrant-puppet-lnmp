node default {
    class { "lnmp":
        www_root => '/vagrant/app',
        www_user => 'vagrant',
        dbname => 'lnmp',
        dbuser => 'lnmp',
        dbpass => 'lnmp',
    }
}