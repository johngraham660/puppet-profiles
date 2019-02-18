require 'spec_helper'

describe 'profiles::websphere::common' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('profiles::websphere::common')}

      it do
        is_expected.to contain_user('wasadmin').with(
          'ensure' => 'present',
          'uid' => '9000',
          'gid' => 'was',
        )
      end

      it do
        is_expected.to contain_user('wasread').with(
          'ensure' => 'present',
          'uid' => '9001',
          'gid' => 'was',
        )
      end
    end
  end
end
