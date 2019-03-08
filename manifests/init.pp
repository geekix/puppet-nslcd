# == Class: nslcd
#
# This class manages the nslcd server and service.
class nslcd (
  Variant[Boolean, String[1]] $package_ensure                                   = $nslcd::params::package_ensure,
  String $package_name                                                          = $nslcd::params::package_name,
  Boolean $package_manage                                                       = $nslcd::params::package_manage,
  Variant[Boolean, Enum['true', 'false', 'running', 'stopped']] $service_ensure = $nslcd::params::service_ensure,
  Boolean $service_enable                                                       = $nslcd::params::service_enable,
  String $service_name                                                          = $nslcd::params::service_name,
  Boolean $service_manage                                                       = $nslcd::params::service_manage,
  String $uid                                                                   = $nslcd::params::uid,
  String $gid                                                                   = $nslcd::params::gid,
  String $config                                                                = $nslcd::params::config,
  String $config_user                                                           = $nslcd::params::config_user,
  String $config_group                                                          = $nslcd::params::config_group,
  String $config_mode                                                           = $nslcd::params::config_mode,
  Hash $config_options                                                          = $nslcd::params::config_options,
  Array $ldap_uris                                                              = $nslcd::params::ldap_uris,
  Enum['2', '3'] $ldap_version                                                  = $nslcd::params::ldap_version,
  String $ldap_binddn                                                           = $nslcd::params::ldap_binddn,
  String $ldap_bindpw                                                           = $nslcd::params::ldap_bindpw,
  String $ldap_search_base                                                      = $nslcd::params::ldap_search_base,
  String $ldap_group_base                                                       = $nslcd::params::ldap_group_base,
  Enum['sub', 'subtree', 'one', 'onelevel', 'base'] $ldap_search_scope          = $nslcd::params::ldap_search_scope,
  Hash $ldap_filters                                                            = $nslcd::params::ldap_filters,
  Hash $ldap_maps                                                               = $nslcd::params::ldap_maps,
  Enum['on', 'off', 'start_tls'] $ldap_ssl                                      = $nslcd::params::ldap_ssl,
  Enum['never', 'allow', 'try', 'demand', 'hard'] $ldap_tls_reqcert             = $nslcd::params::ldap_tls_reqcert,
  String $ldap_tls_cacertfile                                                   = $nslcd::params::ldap_tls_cacertfile,
) inherits nslcd::params {

  anchor { 'nslcd::begin': }
  -> class { 'nslcd::install': }
  -> class { 'nslcd::config': }
  ~> class { 'nslcd::service': }
  -> anchor { 'nslcd::end': }

}
