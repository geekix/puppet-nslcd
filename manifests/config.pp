# == Class: nslcd::config
#
# Manages the nslcd server configuration file
class nslcd::config inherits nslcd {

  file { $nslcd::config:
    ensure  => file,
    owner   => $nslcd::config_user,
    group   => $nslcd::config_group,
    mode    => $nslcd::config_mode,
    content => template('nslcd/nslcd.erb'),
  }

}
