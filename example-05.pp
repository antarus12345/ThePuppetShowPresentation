# You can apply this manifest by running:
# sudo puppet apply --verbose < example-04.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose < example-04.pp

# Puppet has a *third* way to specify ordering. This is called
# 'Chaining' and is helpful when you have a long chain of items.
# It is advantageous to use this method because the ordering of
# the set of items is explicit.

# here we have 4 resources (B,A,D,C) If we wanted to order them
# so they were executed (A,B,C,D) we could use require, or before.
# notify { 'D': message => $name, require => Notify['C'] }
# notify { 'C': message => $name, require => Notify['B'] }
# and so forth...
# However you have to read all the requires, and it is not straightforward.

notify { 'B': message => $name }
notify { 'A': message => $name }
notify { 'D': message => $name }
notify { 'C': message => $name }

# If we Chain them though...
# The ordering of the chain construct is clearer and explicit.
Notify['A'] -> Notify['B'] -> Notify['C'] -> Notify['D']
