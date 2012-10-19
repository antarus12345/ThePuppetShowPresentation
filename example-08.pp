# You can apply this manifest by running:
# sudo puppet apply --verbose < example-08.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-08.pp

# Setting up a service. This is a pretty common task. Here we 
# install ssh, drop in a customize config for it, then turn the
# service on
# Install ssh, install a custom config, then turn ssh on.

package { 'openssh-server':
  ensure => present,
  before => File['/etc/ssh/sshd_config'],
}

file { '/etc/ssh/sshd_config':
  ensure => file,
  mode   => '0600',
  # TODO(antarus): Fix these source lines, they do not work :/
  source => '/root/learning-manifests/sshd_config',
}

# Notice the 'subscribe' paramter here. You might be thinking 'oh that 
# is like inotify', however the subscription is only for when puppet itself
# modifies the parent resource (/etc/ssh/sshd_config in this case.)
service { 'sshd':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
  subscribe  => File['/etc/ssh/sshd_config'],
}
