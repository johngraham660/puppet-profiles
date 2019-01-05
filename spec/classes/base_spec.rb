require 'spec_helper'

describe 'profiles::base' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('profiles::base') }
      it { is_expected.to contain_class('ldapclient') }
      it { is_expected.to contain_class('ssh') }
      it { is_expected.to contain_class('pam') }
      it { is_expected.to contain_class('autofs') }
      it { is_expected.to contain_class('ntp') }
      it { is_expected.to contain_class('rsyslog') }
    end
  end
end
