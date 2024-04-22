# Using Puppet, create a file in /tmp.


file { 'dee_alx_with_puppet_lint':
  path    => '/tmp/school',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet',
}
