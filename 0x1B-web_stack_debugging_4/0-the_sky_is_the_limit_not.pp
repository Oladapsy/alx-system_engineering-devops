#  command => '/bin/sed -i \'s/ULIMIT="-n 15"/ULIMIT="-n 4096"/\' /etc/default/nginx',
#inrease the amount of traffic nginx can handle

#increade the ULIMIT of the nginx default
exec { 'increase-ulimit':
    command => '/bin/sed -i \'s/ULIMIT="-n 15"/ULIMIT="-n 4096"/\' /etc/default/nginx'
}

#restart nginx
exec { 'restart-nginx':
    command => '/usr/bin/service nginx restart'
}
