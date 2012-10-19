# You can apply this manifest by running:
# sudo puppet apply --verbose < example-10.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-10.pp

# Run: sudo facter -p, you will see a bunch of variables called 'facts'.
# These facts are available for you to use in your puppet code. Facts
# reside in the global namespace; you should use $::FACTNAME to
# access them, see below.

host { 'self':
  ensure       => present,
  name         => $::fqdn,
  host_aliases => ['puppet', $::hostname],
  ip           => $::ipaddress,
}
