# == Class: nslcd
#
# This class manages the nslcd server and service.
class nslcd (
  $package_ensure             = $nslcd::params::package_ensure,
  $package_name               = $nslcd::params::package_name,
  $service_ensure             = $nslcd::params::service_ensure,
  $service_enable             = $nslcd::params::service_enable,
  $service_name               = $nslcd::params::service_name,
  $uid                        = $nslcd::params::uid,
  $gid                        = $nslcd::params::gid,
  $config                     = $nslcd::params::config,
  $config_user                = $nslcd::params::config_user,
  $config_group               = $nslcd::params::config_group,
  $config_mode                = $nslcd::params::config_mode,
  $ldap_uris                  = $nslcd::params::ldap_uris,
  $ldap_version               = $nslcd::params::ldap_version,
  $ldap_binddn                = $nslcd::params::ldap_binddn,
  $ldap_bindpw                = $nslcd::params::ldap_bindpw,
  $ldap_search_base           = $nslcd::params::ldap_search_base,
  $ldap_search_scope          = $nslcd::params::ldap_search_scope,
  $ldap_filters               = $nslcd::params::ldap_filters,
  $ldap_maps                  = $nslcd::params::ldap_maps,
  $ldap_ssl                   = $nslcd::params::ldap_ssl,
  $ldap_tls_reqcert           = $nslcd::params::ldap_tls_reqcert,
  $ldap_tls_cacertfile        = $nslcd::params::ldap_tls_cacertfile,
  $ldap_tls_cacertdir         = $nslcd::params::ldap_tls_cacertdir,
  $bind_timelimit             = $nslcd::params::bind_timelimit,
  $timelimit                  = $nslcd::params::timelimit,
  $idle_timelimit             = $nslcd::params::idle_timelimit,
  $reconnect_sleeptime        = $nslcd::params::reconnect_sleeptime,
  $reconnect_retrytime        = $nslcd::params::reconnect_retrytime,
  $pagesize                   = $nslcd::params::pagesize,
  $referrals                  = $nslcd::params::referrals,
  $nss_initgroups_ignoreusers = $nslcd::params::nss_initgroups_ignoreusers,

) inherits nslcd::params {

  # Input validation
  $valid_ldap_versions     = [ '2', '3' ]
  $valid_ldap_ssl          = [ 'on', 'off', 'start_tls' ]
  $valid_ldap_tls_reqcert  = [ 'never', 'allow', 'try', 'demand', 'hard' ]
  $valid_ldap_search_scope = [ 'sub', 'subtree', 'one', 'onelevel', 'base' ]

  validate_re($ldap_version, $valid_ldap_versions)
  validate_re($ldap_ssl, $valid_ldap_ssl)
  validate_re($ldap_tls_reqcert, $valid_ldap_tls_reqcert)
  validate_re($ldap_search_scope, $valid_ldap_search_scope)

  # Ensure that the timing variables are integers.
  validate_integer($bind_timelimit)
  validate_integer($timelimit)
  validate_integer($idle_timelimit)
  validate_integer($reconnect_sleeptime)
  validate_integer($reconnect_retrytime)
  validate_integer($pagesize)

  # do some validation
  $onoff = '^(on|off)$'

  validate_re($referrals, $onoff )

  anchor { 'nslcd::begin': } ->
  class { 'nslcd::install': } ->
  class { 'nslcd::config': } ~>
  class { 'nslcd::service': } ->
  anchor { 'nslcd::end': }

}

