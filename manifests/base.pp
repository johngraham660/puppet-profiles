# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profiles::base
class profiles::base {
  include stdlib

  class { '::ldapclient':
  }

  class { '::ssh':
  }

  class { '::pam':
  }

  class { '::autofs':
  }

  class { '::ntp':
    ntp_config_servers  => lookup( { 'name' => 'ntp_config_servers', 'default_value' => '192.168.1.134' } )
  }

  class { '::rsyslog':
  }
}
