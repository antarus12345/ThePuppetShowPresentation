file {'/tmp/test1':
  ensure  => present,
  content => 'Hi!',
}

file { '/tmp/test2':
  ensure => link,
  target => '/tmp/test1',
  require => File['/tmp/test1'],
}
