# == Class: nslcd
#
# This class manages the nslcd server and service.
class nslcd (
  $config                                                              = $nslcd::params::config,
  $config_group                                                        = $nslcd::params::config_group,
  $config_mode                                                         = $nslcd::params::config_mode,
  $config_options                                                      = $nslcd::params::config_options,
  $config_user                                                         = $nslcd::params::config_user,
  $gid                                                                 = $nslcd::params::gid,
  $ldap_binddn                                                         = $nslcd::params::ldap_binddn,
  $ldap_bindpw                                                         = $nslcd::params::ldap_bindpw,
  $ldap_filters                                                        = $nslcd::params::ldap_filters,
  $ldap_group_base                                                     = $nslcd::params::ldap_group_base,
  $ldap_maps                                                           = $nslcd::params::ldap_maps,
  $ldap_search_base                                                    = $nslcd::params::ldap_search_base,
  $ldap_tls_cacertfile                                                 = $nslcd::params::ldap_tls_cacertfile,
  $ldap_uris                                                           = $nslcd::params::ldap_uris,
  $package_ensure                                                      = $nslcd::params::package_ensure,
  $package_manage                                                      = $nslcd::params::package_manage,
  $package_name                                                        = $nslcd::params::package_name,
  $service_enable                                                      = $nslcd::params::service_enable,
  $service_ensure                                                      = $nslcd::params::service_ensure,
  $service_manage                                                      = $nslcd::params::service_manage,
  $service_name                                                        = $nslcd::params::service_name,
  $uid                                                                 = $nslcd::params::uid,
  Enum['sub', 'subtree', 'one', 'onelevel', 'base'] $ldap_search_scope = $nslcd::params::ldap_search_scope,
  Enum['on', 'off', 'start_tls'] $ldap_ssl                             = $nslcd::params::ldap_ssl,
  Enum['never', 'allow', 'try', 'demand', 'hard'] $ldap_tls_reqcert    = $nslcd::params::ldap_tls_reqcert,
  Enum['2', '3'] $ldap_version                                         = $nslcd::params::ldap_version,
) inherits nslcd::params {

  anchor { 'nslcd::begin': }
  -> class { 'nslcd::install': }
  -> class { 'nslcd::config': }
  ~> class { 'nslcd::service': }
  -> anchor { 'nslcd::end': }

}
