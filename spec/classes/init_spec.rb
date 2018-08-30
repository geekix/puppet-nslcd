require 'spec_helper'

describe 'nslcd' do
  { 'Ubuntu' => 'Debian', 'Debian' => 'Debian', 'CentOS' => 'RedHat', 'RedHat' => 'RedHat' }.each do |system, family|
    context "when on system #{system}" do
      facts = {
        osfamily: family,
        operatingsystem: system,
      }
      let :facts do
        facts
      end

      it { is_expected.to contain_class('nslcd') }
      it { is_expected.to contain_class('nslcd::install') }
      it { is_expected.to contain_class('nslcd::config') }
      it { is_expected.to contain_class('nslcd::service') }

      case facts[:osfamily]
      when 'Debian'
        it {
          is_expected.to contain_package('nslcd')
          is_expected.to contain_service('nslcd')
        }
      when 'RedHat'
        it {
          is_expected.to contain_package('nss-pam-ldapd')
          is_expected.to contain_service('nslcd')
        }
      end
    end
  end

  context 'when on an unknown system' do
    it { is_expected.to raise_error(Puppet::Error) }
  end
end
