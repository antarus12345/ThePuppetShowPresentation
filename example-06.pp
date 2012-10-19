# You can apply this manifest by running:
# sudo puppet apply --verbose < example-04.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-04.pp

# We saw earlier setting file content with the content parameter.
# E.g. file { '/tmp/foo': content => 'hi!' }
# A common use case is simply to copy the contents of a file,
# basic file distribution.

file { '/tmp/test4':
  ensure => file,
  mode   => 600,
  source => '/root/test4',
}