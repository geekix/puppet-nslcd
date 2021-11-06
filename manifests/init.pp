# == Class: nslcd
#
# This class manages the nslcd server and service.
#
# @param package_ensure
#   Sets if the package should be present or absent.
#
# @param package_name
#   Name of the package to install. Depends on the Linux distrib.
#   Set if your platform is not supported.
#
# @param package_manage
#   Sets if the module should manage or not the package installation.
#
# @param service_ensure
#   Sets if the service should be running or stopped.
#
# @param service_enable
#   Sets if the service should be started on startup.
#
# @param service_name
#   Sets the name of the service.
#   Set if your platform is not supported.
#
# @param service_manage
#   Sets if the module should manage or not the service.
#
# @param uid
#   Sets the user to start the daemon.
#
# @param gid
#   Sets the group to start the daemon. Depends on the Linux distrib.
#
# @param config
#   Sets the path of the config file.
#
# @param config_user
#   Sets the owner of the config file.
#
# @param config_group
#   Sets the group of the config file. Depends on the Linux distrib.
#
# @param config_mode
#   Permission of the config file. Depends on the Linux distrib.
#   
# @param ldap_uris
#   Array of LDAP servers.
#
# @param ldap_version
#   Sets the LDAP version to use.
#
# @param ldap_binddn
#   Sets the DN (distinguished name) to bind to the LDAP servers.
#
# @param ldap_bindpw
#   Sets the password to bind to the LDAP servers. Only used if the parameter ldap_binddn is set.
#
# @param ldap_search_base
#   Sets the base DN (distinguished name) to use as the search base.
#
# @param ldap_group_base
#   Sets the base DN (distinguished name) to use as the group search base.
#
# @param ldap_search_scope
#   Sets the search scope depth.
#
# @param config_options
#   Key/Value hash to extend initial configuration.
#
# @param ldap_filters
#   Sets the LDAP search filter for specific mapping.
#
# @param ldap_maps
#   Allows for custom attributes to be looked up.
#
# @param ldap_ssl
#   Whether to use SSL/TLS for the connexion to the LDAP servers.
#
# @param ldap_tls_reqcert
#   Sets what checks to perform on a server-supplied certificate.
#
# @param ldap_tls_cacertfile
#   Sets the path of the PEM-format file containing certificates for the CA's that will be trusted.
#
# @param bind_timelimit
#   Sets the time limit (in seconds) to setup a connexion with the LDAP server.
#
# @param timelimit
#   Sets the time limit (in seconds) to wait for a response from the LDAP server.
#
# @param idle_timelimit
#   Sets the period if inactivity (in seconds) after which the connection to the LDAP server will be closed.
#
# @param reconnect_sleeptime
#   Sets the number of seconds to sleep when connecting to all LDAP servers fails.
#
# @param reconnect_retrytime
#   Sets the time after which the LDAP server is considered to be permanently unavailable.
#   Once this time is reached retries will be done only once per this time period.
#
class nslcd
(
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
  Enum['never','allow','try','demand','hard']    $ldap_tls_reqcert    = 'allow',
  Optional[String[1]]                            $ldap_tls_cacertfile = undef,
  Optional[Integer]                              $bind_timelimit      = undef,
  Integer                                        $timelimit           = 10,
  Optional[Integer]                              $idle_timelimit      = undef,
  Integer                                        $reconnect_sleeptime = 1,
  Integer                                        $reconnect_retrytime = 10,
)
inherits nslcd::params
{
  contain nslcd::install
  contain nslcd::config
  contain nslcd::service
  
  Class['nslcd::install']
  -> Class['nslcd::config']
  ~> Class['nslcd::service']
}