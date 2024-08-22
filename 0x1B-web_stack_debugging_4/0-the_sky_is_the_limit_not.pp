# increase the user limit of nginx server to be able to serve to more traffic

exec { 'Nginx-User-Limit-Increase':
    command => 'sed -i "s/15/4096/" /etc/default/nginx',
    path    => '/bin/:/usr/bin/',
}
exec { 'restart-nginx':
    command => 'nginx restart',
    path    => '/usr/sbin/:/sbin/',
}
