# You can apply this manifest by running:
# sudo puppet apply --verbose < example-09.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-09.pp

# Puppet has variables, both that come with it ($::hostname)
# and variables that you can set yourself.
$long_thing = '....'

file { '/tmp/test5':
  content => $long_thing,
}

notice("Running on ${::hostname}")
