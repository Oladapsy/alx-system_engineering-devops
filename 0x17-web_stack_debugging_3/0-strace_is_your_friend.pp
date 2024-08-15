# fixes bad 'phpp' to 'php' in the wordpress file 'wp-settings.php' on apache2 server

exec { 'fix-wordpress_site':
    command => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
    path    => '/usr/bin/:/bin/',
}
