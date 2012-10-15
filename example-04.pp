file {'/tmp/test1':
  ensure  => present,
  content => 'Hi!',
  before  => File['/tmp/test2'],
}

file {'/tmp/test2':
  ensure => link,
  target => '/tmp/test1',
}

