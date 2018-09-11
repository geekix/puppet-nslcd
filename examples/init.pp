# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
#
class { 'nslcd':
  ldap_uris => ['ldaps://ldap1.domain.local', 'ldaps://ldap2.domain.local'],
  ldap_binddn => 'ldap-nslcd@domain.local',
  ldap_bindpw => 'changeMe',
  ldap_tls_reqcert =>  'demand',
  ldap_ssl  => 'on',
  ldap_search_base => 'dc=domain,dc=local',
  ldap_tls_cacertfile => '/usr/share/ca-certificates/DOMAIN/DOMAIN_ROOT.pem',
  config_options => {
    'referrals'        => 'no',
    'pam_authz_search' => '(&(memberof=CN=sysop,OU=Groups,DC=domain,DC=local)(objectClass=user)(sAMAccountName=$username))',
    'nss_min_uid'      => '2000',
    'idle_timelimit'   => '120',
    'threads'          => '10'
  },
  ldap_filters => {
    'passwd' => '(&(objectClass=user)(!(objectClass=computer))(uidNumber=*)(HomeDirectory=*))',
    'shadow' => '(&(objectClass=user)(!(objectClass=computer))(uidNumber=*)(HomeDirectory=*))',
    'group'  => '(&(objectClass=group)(gidNumber=*))',
  },
  ldap_maps => {
    '1' => 'passwd uid sAMAccountName',
    '2' => 'passwd gecos displayName',
    '3' => 'shadow uid  sAMAccountName',
    '4' => 'shadow shadowLastChange pwdLastSet',
  }
}
