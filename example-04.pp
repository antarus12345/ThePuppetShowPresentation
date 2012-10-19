# You can apply this manifest by running:
# sudo puppet apply --verbose < example-04.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-04.pp

# Puppet also allows you to specify ordering relationships in a second
# way, using 'before' instead of 'require'. In this contrived example
# it doesn't really matter whether we use 'before' or 'require'; however
# more complex examples exists where one is more convenient, particularly
# when relationships are one-to-many.

file {'/tmp/test1':
  ensure  => present,
  content => 'Hi!',
  before  => File['/tmp/test2'],
}

file {'/tmp/test2':
  ensure => link,
  target => '/tmp/test1',
}
