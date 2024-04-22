# Using Puppet, install flask from pip3.

package { 'install flask':
  ensure   => '2.1.0',
  provider => 'flask',
}
