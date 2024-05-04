#!/usr/bin/env bash
# Client configuration file (w/ Puppet)
file {'/etc/ssh/shh_config':
	ensure  => 'present',
}

file_line {'Turn off passwd auth':
	path    => '/etc/ssh/ssh_config',
	line    => 'PasswordAuthentication no',
	match   => 'PasswordAuthentication yes',
	replace => 'true',
	
}
file_line {'Declare identity file':
	path    => '/etc/ssh/ssh_config',
	line    => 'IdentityFile ~/.ssh/school',
	match   => '^IdentityFile',
	ensure  => 'present',
}
