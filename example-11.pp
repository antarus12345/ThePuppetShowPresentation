
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
