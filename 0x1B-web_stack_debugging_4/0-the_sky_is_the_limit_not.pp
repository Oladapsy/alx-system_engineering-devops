# increase the user limit of nginx server to be able to serve to more traffic

#increase user limit of default
exec { 'nginx-user-limit-increase':
    command => 'sed -i \'s/ULIMIT="-n 15"/ULIMIT="-n 4096"/\' /etc/default/nginx',
    path    => '/bin/:/usr/bin/',
}
exec { 'restart-nginx':
    command => 'service nginx restart',
    path    => '/usr/sbin/:/sbin/',
}
