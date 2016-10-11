<?php

if($dockerDBHost = getenv('THUNDER_DB_HOST')) {
  $databases['default']['default'] = array(
    'driver' => 'mysql',
    'database' => 'thunder',
    'username' => 'thunder',
    'password' => 'thunder',
    'host' => $dockerDBHost,
    'port' => '3306'
  );
}

if (empty($settings['hash_salt']))
	      $settings['hash_salt'] = 'ZGVmYXVsdAAAAAEAAAAAADA/EKSAEgABBgAFAA==';
