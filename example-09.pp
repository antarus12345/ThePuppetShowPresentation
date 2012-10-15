# variables.
$long_thing = "...."

file { '/tmp/test5':
  content => $long_thing
}
