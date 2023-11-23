# puppet-nslcd

#### Table of Contents

1. [Overview](#overview)
2. [Dependencies](#dependencies)
3. [Usage](#usage)
4. [What the module affects](#what-the-module-affects)
5. [Parameters](#parameters)
6. [Extend the configuration](#extend-the-configuration)
7. [Limitations](#limitations)
8. [Development](#development)

## Overview

This module installs and configured a local NSLCD daemon.
NSLCD is used to provide LDAP authentication through PAM/NSS.

## Dependencies

[Stdlib - https://forge.puppet.com/modules/puppetlabs/stdlib](https://forge.puppet.com/modules/puppetlabs/stdlib)

## Usage

The module includes a few sane defaults, so it should work out of the box.  
Just fill in these parameters :

* Example

```
class
{
  'nslcd':
    ldap_uris => ['ldap://ldap01.mycompany.com:389','ldap://ldap02.mycompany.com:389'],
    ldap_search_base => 'dc=company,dc=com'
}
```

* The same in Hiera

```
nslcd::ldap_uris:
  - 'ldap://ldap01.company.com:389'
  - 'ldap://ldap02.company.com:389'
nslcd::ldap_search_base: 'dc=company,dc=com'
```

* Will give this in the config file

```
uri ldap://ldap01.company.com:389 ldap://ldap02.company.com:389
base dc=company,dc=com
```

## What the module affects

* `nslcd` package and service
* `/etc/nslcd.conf`

## Parameters

Parameter | Parameter type | Default value | Description
--------- | ---------- | ------------- | -----------
package_ensure | Variant[Boolean,String] | present | Sets if the package should be present or absent.
package_name | String | Depends on the Linux distrib | Name of the package to install. Set if your platform is not supported.
package_manage | Boolean | true | Sets if the module should manage or not the package installation.
service_ensure | Variant[Boolean,Enum['stopped','running']] | running | Sets if the service should be running or stopped.
service_enable | Boolean | true | Sets if the service should be started on system boot.
service_name | String | nslcd | Sets the name of the service. Set if your platform is not supported.
service_manage | Boolean | true | Sets if the module should manage or not the service.
uid | String | nslcd | Sets the user to start the daemon.
gid | String | Depends on the Linux distrib | Sets the group to start the daemon.
config | Stdlib::Unixpath | /etc/nslcd.conf | Sets the path of the config file.
config_user | String | root | Sets the owner of the config file.
config_group | String | Depends on the Linux distrib | Sets the group of the config file.
config_mode | Stdlib::Filemode | Depends on the Linux distrib | Permission of the config file.
config_show_diff | Boolean | false | If set to true, the diff of the configuration file will be shown in the logs and reports. For security reason, it is disabled by default.
ldap_uris | Array[String] | ldap:/// | Array of LDAP servers.
ldap_version | Enum['2','3'] | 3 | Sets the LDAP version to use.
ldap_binddn | String | undef | Sets the DN (distinguished name) to bind to the LDAP servers.
ldap_bindpw | String | undef | Sets the password to bind to the LDAP servers. Only used if the parameter ldap_binddn is set.
ldap_search_base | String | undef | Sets the base DN (distinguished name) to use as the search base.
ldap_group_base | String | undef | Sets the base DN (distinguished name) to use as the group search base.
ldap_search_scope | Enum['sub','subtree','one','onelevel','base'] | subtree | Sets the search scope depth.
config_options | Hash | {} | Key/Value hash to extend the configuration.
ldap_filters | Hash | {} | Sets the LDAP search filter for specific mapping.
ldap_maps | Hash | {} | Allows for custom attributes to be looked up.
ldap_ssl | Enum['on','off','start_tls'] | off | Whether to use SSL/TLS for the connexion to the LDAP servers.
ldap_tls_reqcert | Enum['never','allow','try','demand','hard'] | allow | Sets what checks to perform on a server-supplied certificate.
ldap_tls_cacertfile | String | undef | Sets the path of the PEM-format file containing certificates for the CA's that will be trusted.
bind_timelimit | Integer | undef | Sets the time limit (in seconds) to setup a connexion with the LDAP server.
timelimit | Integer | undef | Sets the time limit (in seconds) to wait for a response from the LDAP server.
idle_timelimit | Integer | undef | Sets the period if inactivity (in seconds) after which the connection to the LDAP server will be closed.
reconnect_sleeptime | Integer | 1 | Sets the number of seconds to sleep when connecting to all LDAP servers fails.
reconnect_retrytime | Integer | 10 | Sets the time after which the LDAP server is considered to be permanently unavailable. Once this time is reached retries will be done only once per this time period.

## Extend the configuration

The module exposes the most commonly used paramaters. However, to extend the configuration use the **config_options** parameter.
It allows you to set any parameter not listed above.

* Example configuration

```
class
{
  'nslcd':
    config_options:
      threads: '10'
}
```

* The same config in Hiera

```
nslcd::config_options:
  threads: '10'
```

* Will give this in the config file

```
threads 10
```

## Limitations

The module has been tested with :

* Ubuntu 14.04 / 16.04 / 18.04 / 20.04
* Debian 8 / 9 / 10 / 11 / 12
* Puppet 4 / 5 / 6 / 7

## Development

If you want to improve this module, send us a pull request !
