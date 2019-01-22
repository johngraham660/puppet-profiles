require 'spec_helper'

describe 'profiles::base' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'with default params' do
        it { is_expected.to contain_class('profiles::base') }
        it { is_expected.to contain_class('ldapclient') }
        it { is_expected.to contain_class('ssh') }
        it { is_expected.to contain_class('pam') }
        #it { is_expected.to contain_class('autofs') }
        it { is_expected.to contain_class('ntp') }
        it { is_expected.to contain_class('rsyslog') }
      end

      context 'with class parameters' do
        #it do
        #  is_expected.to contain_class('autofs').with(
        #    'autofs_service_enable' => true,
        #    'autofs_service_ensure' => 'running',
        #    #'autofs_config_usetls' => 'yes',
        #    'autofs_config_tlsrequired' => 'no',
        #    'autofs_config_authrequired' => 'simple',
        #    'autofs_config_authtype' => 'PLAIN',
        #    'autofs_config_user' => 'cn=proxyAgent,ou=profile,dc=virtua,dc=com',
        #    'autofs_config_secret' => 'pr0xyLDAP',
        #    'autofs_config_timeout' => '300',
        #    'autofs_config_browse_mode' => 'no',
        #    'autofs_config_logging' => 'none',
        #    'autofs_config_map_object_class' => 'automountMap',
        #    'autofs_config_entry_object_class' => 'automount',
        #    'autofs_config_map_attribute' => 'automountMapName',
        #    'autofs_config_entry_attribute' => 'automountKey',
        #    'autofs_config_value_attribute' => 'automountInformation',
        #    'autofs_config_auth_conf_file' => '/etc/autofs_ldap_auth.conf',
        #    'autofs_config_use_misc_device' => 'yes',
        #  )
        #end

        it do
          is_expected.to contain_class('ldapclient').with(
            'ldapclient_service_enable' => true,
            'ldapclient_service_ensure' => 'running',
            'ldapclient_config_servers' => 'qnap869.virtua.vm',
            'ldapclient_config_basedn' => 'dc=virtua,dc=com',
            'ldapclient_config_uri' => 'ldap://192.168.1.202',
            'ldapclient_config_proxypass' => 'ProxyPass123',
          )
        end

        it do
          is_expected.to contain_class('ntp').with(
            'ntp_service_enable' => true,
            'ntp_service_ensure' => 'running',
            'ntp_config_servers' => 'qnap869.virtua.vm',
          )
        end

        it do
          is_expected.to contain_class('pam').with(
            'pam_service_enable' => true,
            'pam_service_ensure' => 'running',
          )
        end

        it do
          is_expected.to contain_class('rsyslog').with(
            'rsyslog_service_enable' => true,
            'rsyslog_service_ensure' => 'running',
          )
        end

        it do
          is_expected.to contain_class('ssh').with(
            'ssh_service_enable' => true,
            'ssh_service_ensure' => 'running',
            'ssh_config_x11forwarding' => 'no',
            'ssh_config_print_motd' => 'yes',
            'ssh_config_print_banner' => 'yes',
            'ssh_config_banner_content' => 'puppet:///modules/ssh/issue',
            'ssh_config_banner_path' => '/etc/issue',
            'ssh_config_use_dns' => 'no',
            'ssh_config_strictmodes' => 'yes',
            'ssh_config_permitrootlogin' => 'without-password',
            'ssh_package_server' => 'openssh-server',
            'ssh_package_client' => 'openssh-client',
          )
        end
      end
    end
  end
end
