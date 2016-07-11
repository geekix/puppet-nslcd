# == Class: nslcd::install
#
# Installs the nslcd package.
class nslcd::install inherits nslcd {

  if $nslcd::package_manage {
    package { $nslcd::package_name:
      ensure => $nslcd::package_ensure,
    }
  }

}
