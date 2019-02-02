# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profiles
class profiles {
  include profiles::base
  include profiles::apache
  include profiles::nginx
  include profiles::mysql
  include profiles::postgres
  include profiles::jenkins::master
  include profiles::jenkins::slave
  include profiles::haproxy
  include profiles::puppetserver
}
