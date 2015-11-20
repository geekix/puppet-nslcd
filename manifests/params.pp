# == Class: nslcd::params
#
# Sets the default parameters for the nslcd class.
class nslcd::params {

  $package_ensure = present
  $service_ensure = running
  $service_enable = true

  $ldap_uris                  = ['ldap:///']
  $ldap_version               = '3'
  $ldap_binddn                = undef
  $ldap_bindpw                = undef
  $ldap_search_base           = ''
  $ldap_search_scope          = 'subtree'
  $ldap_filters               = {}
  $ldap_maps                  = {}
  $ldap_ssl                   = 'off'
  $ldap_tls_reqcert           = 'allow'
  $ldap_tls_cacertfile        = undef
  $ldap_tls_cacertder         = undef
  $bind_timelimit             = 10
  $timelimit                  = 0
  $idle_timelimit             = 0
  $reconnect_sleeptime        = 1
  $reconnect_retrytime        = 10
  $pagesize                   = 0
  $referrals                  = 'on'
  $nss_initgroups_ignoreusers = undef

  case $::osfamily {
    'Debian': {
      $config               = '/etc/nslcd.conf'
      $package_name         = 'nslcd'
      $service_name         = 'nslcd'
      $uid                  = 'nslcd'
      $gid                  = 'nslcd'
      $config_user          = 'root'
      $config_group         = 'nslcd'
      $config_mode          = '0640'
    }
    'RedHat': {
      $config               = '/etc/nslcd.conf'
      $package_name         = 'nss-pam-ldapd'
      $service_name         = 'nslcd'
      $uid                  = 'nslcd'
      $gid                  = 'root'
      $config_user          = 'root'
      $config_group         = 'root'
      $config_mode          = '0600'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}

