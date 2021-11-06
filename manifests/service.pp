# == Class: nslcd::service
#
# Manages the nslcd service.
#
class nslcd::service inherits nslcd
{
  if $nslcd::service_manage
  {
    service
    {
      'nslcd':
        ensure => $nslcd::service_ensure,
        enable => $nslcd::service_enable,
        name   => $nslcd::service_name,
    }
  }
}