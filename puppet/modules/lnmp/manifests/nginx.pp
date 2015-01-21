class lnmp::nginx(
  $www_root = '/vagrant/app',
  $hostname = 'localhost',
) {
  package { "nginx": }
  service { "nginx":
    ensure     => "running",
    hasrestart => true,
    hasstatus  => true,
    require    => Package["nginx"]
  }
  file { "/etc/nginx/sites-available/default":
    content => template("lnmp/default-site.erb"),
    require => Package["nginx"],
    notify  => Service["nginx"]
  }
}
