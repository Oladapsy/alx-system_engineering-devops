# Install Nginx web server (w/ Puppet)
# To save time and effort, you should also include resources in your manifest to perform a 301 redirect when querying /redirect_me
# Nginx should be listening on port 80
 When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string Hello World!
# The redirection must be a “301 Moved Permanently”
# Your answer file should be a Puppet manifest containing commands to automatically configure an Ubuntu machine to respect above requirements

# install nginx with puppet

package {'nginx':
	ensure => installed,
}

file_line { 'install':
	ensure => 'present',
	path   => '/etc/nginx/site-available/default',
	after  => 'listen 80 default_server;',
	line   => 'rewrite ^/redirect_me https://www.youtube.com/@cryptotechcoder permanent;',
}

file {'/var/www/html/index.html',
	content => 'Hello World!',
}

service {'nginx':
	ensure  => running,
	require => package['nginx'],
}
