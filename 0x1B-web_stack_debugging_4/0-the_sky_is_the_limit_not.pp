# Increases the amount of traffic an Nginx server can handle.

# Increase the ULIMIT of the default file
exec { 'fix--for-nginx':
  command => '/bin/sed -i \'s/ULIMIT="-n 15"/ULIMIT="-n 4096"/\' /etc/default/nginx',
}
# Restart Nginx
exec { 'nginx-restart':
  command => '/usr/sbin/service nginx restart',
}
