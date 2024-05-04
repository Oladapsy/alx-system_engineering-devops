#!/usr/bin/env bash
# Client configuration file (w/ Puppet)
file_line {'Turn off passwd auth':
	ensure => 'present',
	path   => '/etc/ssh/ssh_config'
	line   => 'PasswordAuthentication no',
	match  => 'PasswordAuthentication yes',
}
file_line {'Declare identity file':
	ensure => 'present',
	path   => '/etc/ssh/ssh_config',
	line   => 'IdentityFile ~/.ssh/school',
}
