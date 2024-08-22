#increase the security/config limit soft and hard

#increase hard file limit for holberton user
exec { 'increase-hard-limit-for-holberton-user':
    command => 'sed -i "/holberton hard/s/5/50000/" /etc/security/limits.conf',
    path    => '/usr/bin/:/bin/',
}

#increase soft file limit for holberton user
exec { 'increase-soft-limit-for-holberton-user':
    command => 'sed -i "/holberton soft/s/5/50000/" /etc/security/limits.conf',
    path    => '/usr/bin/:/bin/',
}
