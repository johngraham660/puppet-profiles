# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include profiles::websphere::common
class profiles::websphere::common {

  $websphere_users = lookup('profiles::websphere::common::websphere_users', {value_type => Hash })
  $websphere_groups = lookup('profiles::websphere::common::websphere_groups', {value_type => Hash })

  create_resources(user, $websphere_users)
  create_resources(group, $websphere_groups)

}
