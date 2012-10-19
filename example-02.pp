# You can apply this manifest by running:
# sudo puppet apply --verbose < example-02.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-02.pp
# puppet wants to run as root, so try not to run it as yourself

# The 'file' resource writes files to the filesystem.
# You can ensure permissions, owner, group, file vs symlink vs directory, etc.
# Want help? Try 'puppet describe file | less'

file { '/tmp/test1':
  ensure  => present,
  content => "Hi.",
}

file { '/tmp/test2':
  ensure => directory,
  mode   => 0644,
}

file { '/tmp/test3':
  ensure => link,
  target => '/tmp/test1',
}

# Notify is a resource that just prints messages, usually for logging / debug stuff.
notify { 'I\'m notifying you.': } # Whitespace is fungible, remember.
notify { 'So am I!': }

