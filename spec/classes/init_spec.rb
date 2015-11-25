require 'spec_helper'

describe 'nslcd' do

  {'RedHat' => 'RedHat', 'Ubuntu' => 'Debian', 'Debian' => 'Debian'}.each do |system, family|
    context "when on system #{system}" do
      let :facts do
        {
          :osfamily        => family,
          :operatingsystem => system,
        }
      end

      it { should contain_class('nslcd') }
      it { should contain_class('nslcd::install') }
      it { should contain_class('nslcd::config') }
      it { should contain_class('nslcd::service') }

      it {
        should contain_package('nslcd')
        should contain_service('nslcd')
      }
    end
  end

  context 'when on an unknown system' do
    it { expect { should raise_error(Puppet::Error) } }
  end
end
