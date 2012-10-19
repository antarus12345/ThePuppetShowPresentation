# You can apply this manifest by running:
# sudo puppet apply --verbose < example-11.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-11.pp


# Facts are always strings :/
if $::is_virtual == 'true' {
  notify { 'this is a virtual machine':}
  service { 'ntpd':
    ensure => stopped,
    enable => false,
  }
} else {
  # 'false' is undef, '', false
  service { 'ntpd':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['ntp'],
  }
}
