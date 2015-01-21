class lnmp::setup {

    # Install some default packages
    #
    # Vim for editing
    $default_packages = [ "vim"]
    package { $default_packages :
        ensure => present,
    }

    package { "git-core" :
        name => "git",
        ensure => present,
    }

}
