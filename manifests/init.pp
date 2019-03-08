# == Class: nslcd
#
# This class manages the nslcd server and service.
class nslcd (
  Variant[Boolean,String[1]]                     $package_ensure      = 'present',
  String[1]                                      $package_name        = $nslcd::params::package_name,
  Boolean                                        $package_manage      = true,
  Variant[Boolean,Enum['stopped','running']]     $service_ensure      = 'running',
  Boolean                                        $service_enable      = true,
  String[1]                                      $service_name        = 'nslcd',
  Boolean                                        $service_manage      = true,
  String[1]                                      $uid                 = 'nslcd',
  String[1]                                      $gid                 = $nslcd::params::gid,
  Stdlib::Unixpath                               $config              = '/etc/nslcd.conf',
  String[1]                                      $config_user         = 'root',
  String[1]                                      $config_group        = $nslcd::params::config_group,
  Stdlib::Filemode                               $config_mode         = $nslcd::params::config_mode,
  Array[String[1]]                               $ldap_uris           = ['ldap:///'],
  Enum['2','3']                                  $ldap_version        = '3',
  Optional[String[1]]                            $ldap_binddn         = undef,
  Optional[String[1]]                            $ldap_bindpw         = undef,
  Optional[String[1]]                            $ldap_search_base    = undef,
  Optional[String[1]]                            $ldap_group_base     = undef,
  Enum['sub','subtree','one','onelevel','base']  $ldap_search_scope   = 'subtree',
  Hash                                           $config_options      = {},
  Hash                                           $ldap_filters        = {},
  Hash                                           $ldap_maps           = {},
  Enum['on','off','start_tls']                   $ldap_ssl            = 'off',
  Enum['never','allow','try','demand','hard' ]   $ldap_tls_reqcert    = 'allow',
  Optional[String[1]]                            $ldap_tls_cacertfile = undef,
) inherits nslcd::params {

  contain nslcd::install
  contain nslcd::config
  contain nslcd::service

  Class['nslcd::install']
  -> Class['nslcd::config']
  ~> Class['nslcd::service']

}
