# puppet-nslcd

[![Build Status](https://travis-ci.org/geekix/puppet-nslcd.svg?branch=master)](https://travis-ci.org/geekix/puppet-nslcd)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with nslcd](#setup)
    * [What nslcd affects](#what-nslcd-affects)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs and configured nslcd to get pam/nss data from ldap.

## Module Description

This module allows you to install and configure the nslcd daemon (and its dependencies), to provide ldap support for 
PAM and NSS.

## Setup

### What nslcd affects

* `nslcd` package and service
* `/etc/nslcd.conf`

## Usage

Simply include/contain/required/declare the nslcd class.
It includes a few sane defaults, so it should work out of the box.
However, we recommend that you declare the class and override a few parameters:

* In the module

```
class { 'nslcd':
  ldap_uris => ['ldap://ldap01.mycompany.com:389','ldap://ldap02.mycompany.com:389'],
  ldap_search_base => 'dc=company,dc=com'
}
```

* In hieradata

```
nslcd::ldap_uris:
  - 'ldap://ldap01.company.com:389'
  - 'ldap://ldap02.company.com:389'
nslcd::ldap_search_base: 'dc=company,dc=com'
```

## Reference

*todo*

## Limitations

/!\ Important information: The module will be updated to work with Puppet 4.x. The next release will be tested and compatible with Ubuntu 14.04, Ubuntu 16.04, Ubuntu 18.04, Debian 8 and Debian 9 /!\

The module has been tested with Ubuntu 12.04 and 14.04, Debian 6 and 7, and Puppet 3.7.
It should work Puppet 3.x.
For additional OS support, you should contribute it back upstream!

The module doesn't support setting the `rootbinddn` and `rootbindpw` attributes, but it can be easily added.

## Development

If you want to improve this module, send us a patch of pull request!

