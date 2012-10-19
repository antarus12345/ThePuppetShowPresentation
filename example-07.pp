# You can apply this manifest by running:
# sudo puppet apply --verbose < example-07.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-07.pp

# Puppet can also manage packages for you.
# TODO(antarus): Verify that these package names work on SUSE and Gentoo.
# There is still the problem of cross-platform package names, we will
# discuss how to solve this problem when we get to conditionals.

# Remember you can get help with the puppet types by running:
# puppet describe <type> 'puppet describe package' will display parameters
# for the package type.
package { 'htop':
  ensure => present,
}

package { 'sl':
  ensure => '3.03-16',
}

package { 'doxygen':
  ensure => 'absent',
}
