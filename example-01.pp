# A simple example of adding a user.
# You can apply this manifest by running:
# sudo puppet apply --verbose < example-01.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-01.pp
# puppet wants to run as root, so try not to run it as yourself

user { 'test':
  # ensure sort of means 'add', we could for example 'ensure => absent' which
  # would remove the user.
  ensure     => present,
  uid        => '10000',
  gid        => 'admin',
  shell      => '/bin/bash',
  home       => '/home/test',
  # Make the homedir for user test when we add user test.
  managehome => true,
}
