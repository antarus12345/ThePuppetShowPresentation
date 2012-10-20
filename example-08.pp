# A simple example of adding a user.
# You can apply this manifest by running:
# sudo puppet apply --verbose --moduledir modules < example-08.pp
# To run in 'dry-run' mode, add --noop
# sudo puppet apply --noop --verbose --moduledir modules < example-08.pp
# puppet wants to run as root, so try not to run it as yourself

include ssh
