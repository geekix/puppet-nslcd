# Change log

All notable changes to this project will be documented in this file.

## 0.4.4 (2023-11-23)

### Addition

- Add the show_diff parameter and set value to false by default for security reasons. Thanks @MaxHerrmannSVA for the PR (https://github.com/geekix/puppet-nslcd/pull/24)

### Changed

- Update stdlib dependencies and supported Debian versions. Thanks @virus2500 for the PR (https://github.com/geekix/puppet-nslcd/pull/25)

## 0.4.3 (2021-11-07)

### Changed

- Add support for RedHat RHEL in the metadata

## 0.4.2 (2021-11-05)

### Addition

- New parameters (bind_timelimit, timelimit, idle_timelimit, reconnect_sleeptime, reconnect_retrytime)
- New Hiera example files

### Changed

- Documentation reviewed and improved
- ldap_search_base parameter is now optional
- Module converted to the latest version of PDK (2.2.0)

## 0.4.1 (2019-03-11)

### [Related PR : https://github.com/geekix/puppet-nslcd/pull/18]

### Fixed

- Deprecated validate_ functions replaced with parameter data types
- Deprecated anchor pattern replaced with contain function
- Minor whitespace inconsistency in metadata.json

### Changed

- Move default parameters from params.pp to init.pp

## 0.4.0 (2019-03-06)

### Changed

- Add ldap_maps hash to allow for custom map attributes (see "map" parameter in the [nslcd.conf manpage](https://linux.die.net/man/5/nslcd.conf))
