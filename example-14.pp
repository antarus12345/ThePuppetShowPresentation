$apache = $operatingsystem ? {
  centos                => 'httpd',
  redhat                => 'httpd',
  /(?i)(ubuntu|debian)/ => "apache2-$1",
  default               => undef,
}

