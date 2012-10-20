# You can apply this manifest by running:
# sudo puppet apply --verbose < example-03.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-03.pp

# Ordering is helpful. Here we have 2 file resources, one that
# creates '/tmp/test1' and one that creates 'tmp/test2' wihch is
# a symlink to /tmp/test2

# If we don't specify the ordering explicitly, puppet is free to
# apply the resources in any order. This is bad in this case because
# it may create /tmp/test2 -> /tmp/test1, before /tmp/test1 is made.
# This will result in a broken symlink until /tmp/test1 is made. While
# this example is quite contrived (made up) there are obviously more
# complex examples.

file { '/tmp/test2':
  ensure  => link,
  target  => '/tmp/test1',
  require => File['/tmp/test1'],
}

file { '/tmp/test1':
  ensure  => present,
  content => 'Hi!',
}

