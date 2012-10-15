# A simple example of adding a user.

user { 'test':
  ensure     => present,
  uid        => '10000',
  gid        => 'admin',
  shell      => '/bin/bash',
  home       => '/home/test',
  managehome => true,
}
