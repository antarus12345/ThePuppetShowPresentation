# You can apply this manifest by running:
# sudo puppet apply --verbose < example-12.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-12.pp

# As I touched on earlier, distributions may have different names for
# the same package. Here we try to solve that with the 'case' conditional
# Only one branch of the case is executed (first-match.)

case $operatingsystem {
  centos: { $apache = 'httpd' }
  redhat: { $apache = 'httpd' }
  debian: { $apache = 'apache2' }
  ubuntu: { $apache = 'apache2' }
  default: { fail('Unrecognized operating system for webserver') }
}

package { $apache:
  ensure => latest
}
