require 'spec_helper'

describe 'profiles::jenkins' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('profiles::jenkins') }
    end
  end
end
