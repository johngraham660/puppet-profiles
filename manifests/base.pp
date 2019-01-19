# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profiles::base
class profiles::base {

  # ==============================================
  # Hiera lookups for ldapclient class parameters
  # ==============================================
  $ldapclient_service_enable = lookup('profiles::base::ldapclient_service_enable', {value_type => Boolean})
  $ldapclient_service_ensure = lookup('profiles::base::ldapclient_service_ensure', {value_type => String})
  $ldapclient_config_servers = lookup('profiles::base::ldapclient_config_servers', {value_type => String})
  $ldapclient_config_basedn = lookup('profiles::base::ldapclient_config_basedn', {value_type => String})
  $ldapclient_config_uri = lookup('profiles::base::ldapclient_config_uri', {value_type => String})
  $ldapclient_config_proxypass = lookup('profiles::base::ldapclient_config_proxypass', {value_type => String})

  # ======================================
  # Hiera lookups for ssh class parameters
  # ======================================
  $ssh_service_enable = lookup('profiles::base::ssh_service_enable', {value_type => Boolean, default_value => false })
  $ssh_service_ensure = lookup('profiles::base::ssh_service_ensure', {value_type => String, default_value => 'stopped' })
  $ssh_config_x11forwarding = lookup('profiles::base::ssh_config_x11forwarding', {value_type => String, default_value => 'no' })
  $ssh_config_print_motd = lookup('profiles::base::ssh_config_print_motd', {value_type => String, default_value => 'yes' })
  $ssh_config_print_banner = lookup('profiles::base::ssh_config_print_banner', {value_type => String, default_value => 'yes' })
  $ssh_config_banner_content = lookup('profiles::base::ssh_config_banner_content', {value_type => String, default_value => 'puppet:///modules/ssh/issue' })
  $ssh_config_banner_path = lookup('profiles::base::ssh_config_banner_path', {value_type => String, default_value => '/etc/issue' })
  $ssh_config_use_dns = lookup('profiles::base::ssh_config_use_dns', {value_type => String, default_value => 'no' })
  $ssh_config_strictmodes = lookup('profiles::base::ssh_config_strictmodes', {value_type => String, default_value => 'yes' })
  $ssh_config_permitrootlogin = lookup('profiles::base::ssh_config_permitrootlogin', {value_type => String, default_value => 'without-password' })
  $ssh_package_server = lookup('profiles::base::ssh_package_server', {value_type => String, default_value => 'openssh-server' })
  $ssh_package_client = lookup('profiles::base::ssh_package_client', {value_type => String, default_value => 'openssh-client' })

  # ======================================
  # Hiera lookups for pam class parameters
  # ======================================
  $pam_service_enable = lookup('profiles::base::pam_service_enable', {value_type => Boolean, default_value => false })
  $pam_service_ensure = lookup('profiles::base::pam_service_ensure', {value_type => String, default_value => 'stopped'})

  # =========================================
  # Hiera lookups for autofs class parameters
  # =========================================
  $autofs_service_enable = lookup('profiles::base::autofs_service_enable', {value_type => Boolean, default_value => false })
  $autofs_service_ensure = lookup('profiles::base::autofs_service_ensure', {value_type => String, default_value => 'stopped' })
  $autofs_config_usetls = lookup('profiles::base::autofs_config_usetls', {value_type => String, default_value => 'yes' })
  $autofs_config_tlsrequired = lookup('profiles::base::autofs_config_tlsrequired', {value_type => String, default_value => 'no' })
  $autofs_config_authrequired = lookup('profiles::base::autofs_config_authrequired', {value_type => String, default_value => 'simple' })
  $autofs_config_authtype = lookup('profiles::base::autofs_config_authtype', {value_type => String, default_value => 'PLAIN' })
  $autofs_config_user = lookup('profiles::base::autofs_config_user', {value_type => String, default_value => 'cn=proxyAgent,ou=profile,dc=virtua,dc=com' })
  $autofs_config_secret = lookup('profiles::base::autofs_config_secret', {value_type => String, default_value => 'pr0xyLDAP' })
  $autofs_config_timeout = lookup('profiles::base::autofs_config_timeout', {value_type => Integer, default_value => 300 })
  $autofs_config_browse_mode = lookup('profiles::base::autofs_config_browse_mode', {value_type => String, default_value => 'no' })
  $autofs_config_logging = lookup('profiles::base::autofs_config_logging', {value_type => String, default_value => 'none' })
  $autofs_config_map_object_class = lookup('profiles::base::autofs_config_map_object_class', {value_type => String, default_value => 'automountMap' })
  $autofs_config_entry_object_class = lookup('profiles::base::autofs_config_entry_object_class', {value_type => String, default_value => 'automount' })
  $autofs_config_map_attribute = lookup('profiles::base::autofs_config_map_attribute', {value_type => String, default_value => 'automountMapName' })
  $autofs_config_entry_attribute  = lookup('profiles::base::autofs_config_entry_attribute', {value_type => String, default_value => 'automountKey' })
  $autofs_config_value_attribute = lookup('profiles::base::autofs_config_value_attribute', {value_type => String, default_value => 'automountInformation' })
  $autofs_config_auth_conf_file = lookup('profiles::base::autofs_config_auth_conf_file', {value_type => String, default_value => '/etc/autofs_ldap_auth.conf' })
  $autofs_config_use_misc_device = lookup('profiles::base::autofs_config_use_misc_device', {value_type => String, default_value => 'yes' })

  # =========================================
  # Hiera lookups for ntp class parameters
  # =========================================
  $ntp_service_enable = lookup('profiles::base::ntp_service_enable', {value_type => Boolean, default_value => false })
  $ntp_service_ensure = lookup('profiles::base::ntp_service_ensure', {value_type => String, default_value => 'stopped' })
  $ntp_config_servers = lookup('profiles::base::ntp_config_servers', {value_type => String, default_value => 'qnap869.virtua.vm' })

  # ==========================================
  # Hiera lookups for rsyslog class parameters
  # ==========================================
  $rsyslog_service_enable = lookup('profiles::base::rsyslog_service_enable', {value_type => Boolean, default_value => false })
  $rsyslog_service_ensure = lookup('profiles::base::rsyslog_service_ensure', {value_type => String, default_value => 'stopped' })

  class { '::autofs':
    autofs_service_enable            => $autofs_service_enable,
    autofs_service_ensure            => $autofs_service_ensure,
    autofs_config_usetls             => $autofs_config_usetls,
    autofs_config_tlsrequired        => $autofs_config_tlsrequired,
    autofs_config_authrequired       => $autofs_config_authrequired,
    autofs_config_authtype           => $autofs_config_authtype,
    autofs_config_user               => $autofs_config_user,
    autofs_config_secret             => $autofs_config_secret,
    autofs_config_timeout            => $autofs_config_timeout,
    autofs_config_browse_mode        => $autofs_config_browse_mode,
    autofs_config_logging            => $autofs_config_logging,
    autofs_config_map_object_class   => $autofs_config_map_object_class,
    autofs_config_entry_object_class => $autofs_config_entry_object_class,
    autofs_config_map_attribute      => $autofs_config_map_attribute,
    autofs_config_entry_attribute    => $autofs_config_entry_attribute,
    autofs_config_value_attribute    => $autofs_config_value_attribute,
    autofs_config_auth_conf_file     => $autofs_config_auth_conf_file,
    autofs_config_use_misc_device    => $autofs_config_use_misc_device,
  }

  class { '::ldapclient':
    ldapclient_service_enable   => $ldapclient_service_enable,
    ldapclient_service_ensure   => $ldapclient_service_ensure,
    ldapclient_config_servers   => $ldapclient_config_servers,
    ldapclient_config_basedn    => $ldapclient_config_basedn,
    ldapclient_config_uri       => $ldapclient_config_uri,
    ldapclient_config_proxypass => $ldapclient_config_proxypass,
  }

  class { '::ntp':
    ntp_service_enable => $ntp_service_enable,
    ntp_service_ensure => $ntp_service_ensure,
    ntp_config_servers => $ntp_config_servers,
  }

  class { '::pam':
    pam_service_enable => $pam_service_enable,
    pam_service_ensure => $pam_service_ensure,
  }

  class { '::rsyslog':
    rsyslog_service_enable => $rsyslog_service_enable,
    rsyslog_service_ensure => $rsyslog_service_ensure,
  }

  class { '::ssh':
    ssh_service_enable         => $ssh_service_enable,
    ssh_service_ensure         => $ssh_service_ensure,
    ssh_config_x11forwarding   => $ssh_config_x11forwarding,
    ssh_config_print_motd      => $ssh_config_print_motd,
    ssh_config_print_banner    => $ssh_config_print_banner,
    ssh_config_banner_content  => $ssh_config_banner_content,
    ssh_config_banner_path     => $ssh_config_banner_path,
    ssh_config_use_dns         => $ssh_config_use_dns,
    ssh_config_strictmodes     => $ssh_config_strictmodes,
    ssh_config_permitrootlogin => $ssh_config_permitrootlogin,
    ssh_package_server         => $ssh_package_server,
    ssh_package_client         => $ssh_package_client,
  }
}
