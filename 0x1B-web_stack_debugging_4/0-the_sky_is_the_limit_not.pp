#increase the number of traffic that can be hanled by nginx

#increase the ULIMIT of the default nginx file
exec { 'increase-ulimit-nginx':
    command => 'sed -i \'s/ULIMIT="-n 15"/ULIMIT="-n 4096"/\' etc/default/nginx',
    path    => '/bin/',
}
#restart nginx
exec { 'nginx-restart':
    command => 'service nginx restart',
    path    => '/usr/sbin/',
}
