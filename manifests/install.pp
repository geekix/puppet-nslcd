# == Class: nslcd::install
#
# Installs the nslcd package.
class nslcd::install inherits nslcd {

  package { $nslcd::package_name:
    ensure => $nslcd::package_ensure,
  }

}
