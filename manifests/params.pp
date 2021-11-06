# == Class: nslcd::params
#
# Sets the default parameters for the nslcd class.
#
class nslcd::params
{
  case $::osfamily
  {
    'Debian':
    {
      $package_name = 'nslcd'
      $gid          = 'nslcd'
      $config_group = 'nslcd'
      $config_mode  = '0640'
    }
    'RedHat':
    {
      $package_name = 'nss-pam-ldapd'
      $gid          = 'ldap'
      $config_group = 'root'
      $config_mode  = '0600'
    }
    default:
    {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}