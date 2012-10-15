file {'/tmp/test1':
  ensure  => present,
  content => 'Hi!',
}

notify {'after':
  message => '/tmp/test1 has already been synced.',
}

# Chaining.
File['/tmp/test1'] -> Notify['after']

