file { '/tmp/test4':
  ensure => file,
  mode   => 600,
  source => '/root/test4',
}
