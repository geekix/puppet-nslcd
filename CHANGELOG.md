# Change log

All notable changes to this project will be documented in this file.

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
