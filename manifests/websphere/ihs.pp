# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profiles::websphere::ihs
class profiles::websphere::ihs {

  $websphere_volume_group = lookup('profiles::websphere::ihs::lvm::volume_groups', {value_type => Hash })

  class { '::websphere':
    websphere_volume_group => $websphere_volume_group,
  }

}
