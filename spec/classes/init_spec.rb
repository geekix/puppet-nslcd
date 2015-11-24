require 'spec_helper'

describe 'nslcd' do

  {'Ubuntu' => 'Debian', 'Debian' => 'Debian', 'CentOS' => 'RedHat', 'RedHat' => 'RedHat' }.each do |system, family|
    context "when on system #{system}" do
      facts = {
          :osfamily        => family,
          :operatingsystem => system,
      }
      let :facts do
        facts
      end

      it { should contain_class('nslcd') }
      it { should contain_class('nslcd::install') }
      it { should contain_class('nslcd::config') }
      it { should contain_class('nslcd::service') }


      case facts[:osfamily]
      when 'Debian'
        it {
          should contain_package('nslcd')
          should contain_service('nslcd')
        }
      when 'RedHat'
        it {
          should contain_package('nss-pam-ldapd')
          should contain_service('nslcd')
        }
      end
    end
  end

  context 'when on an unknown system' do
    it { expect { should raise_error(Puppet::Error) } }
  end
end
