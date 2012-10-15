# Facts are in the global namespace. TL;DR You should use $::FACTNAME to
# access them.

host { 'self':
  ensure       => present,
  name         => $::fqdn,
  host_aliases => ['puppet', $::hostname],
  ip           => $::ipaddress,
}

