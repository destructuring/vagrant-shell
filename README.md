# Vagrant Shell Provider

This is a [Vagrant](http://www.vagrantup.com) 1.2+ plugin that adds a
shell provider to Vagrant, allowing Vagrant to control and provision
machines using shell scripts.  It's meant to be customized with scripts
for Xen, Docker, etc.

**NOTE:** This plugin requires Vagrant 1.2+, ruby 1.9, and bundler.

vagrant-shell is forked from vagrant-aws with the fog/aws parts replaced
with a shell script that takes four sub-commands: run-instance,
terminate-instance, ssh-info, and read-state.

See `libexec/shell-docker` for an example.

## Usage

I don't know how to instal vagrant-shell as a plugin, so this repo uses
bundler and cached gems.  Requires ruby 1.9.3 (vagrant).

Run make to bundle gems and install the demo vagrant box:

    make

Bring up the docker container:

    bundle exec vagrant up --provider shell

The commands passed to the container are sourced from `libexec/init-docker`.
It sets up the root user with an ssh key suitable for vagrant.

SSH into the container:

    bundle exec vagrant ssh
