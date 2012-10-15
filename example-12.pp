case $operatingsystem {
  centos: { $apache = 'httpd' }
  redhat: { $apache = 'httpd' }
  debian: { $apache = 'apache2' }
  ubuntu: { $apache = 'apache2' }
  default: { fail{'Unrecognized operating system for webserver') }
}
package{'apache':
  name   => $apache,
  ensure => latest,
}
