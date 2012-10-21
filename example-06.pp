# You can apply this manifest by running:
# sudo puppet apply --verbose < example-04.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-04.pp

# We saw earlier setting file content with the content parameter.
# E.g. file { '/tmp/foo': content => 'hi!' }
# A common use case is simply to copy the contents of a file,
# basic file distribution. We will see that later (as it is slightly more
#  complicated.)

# For now we present the evil that is inline_template. This allows you to
#  execute pure ruby.

file { '/tmp/test4':
  ensure  => file,
  mode    => '0755',
  # Here we are looking to see if a variable 'custom_timeout' exists.
  # If it exists, we convert it to int and consume that value.
  # Otherwise we set a sane default.
  content => inline_template('<%= scope.lookupvar("custom_timeout").nil? ? custom_timeout.to_i : 5 %>'),
}

# inline template can also be used to generate file contents.

$content = inline_template('
Explanation: Managed Apt Pin
<% explanation.each do |e| -%>
Epxlanation: <%= e %>
<% end -%>
Package: <%= package %>
<% pin.each do |p| -%>
Pin <%= p %>
<% end -%>
Pin-Priority: <%= priority.to_s %>
')
