#!/bin/env sh

# check the foreman is install
if !gem list -i --slient; then
    echo 'installing foreman'
    gem install foreman
fi

#run the procefile
exec foreman start -f Procfile.dev "$@"