# Using Puppet, install flask from pip3.

package { 'python3.8':
    ensure  => '3.8.10'
}

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package { 'werkzeug':
  ensure   => 'latest',
  provider => 'pip3',
  require  => Package['Flask'],
}

