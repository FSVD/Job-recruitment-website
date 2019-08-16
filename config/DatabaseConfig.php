<?php

require('../vendor/autoload.php');

$dotenv = Dotenv\Dotenv::create('../');
$dotenv->load();

define('DB_HOST', env('DB_HOST'));
define('DB_NAME', env('DB_NAME'));
define('DB_USER', env('DB_USER'));
define('DB_PASSWORD', env('DB_PASSWORD'));
define('DB_PORT', env('DB_PORT'));
define('DB_CHARSET', env('DB_CHARSET'));
define('DB_COLLATION', env('DB_COLLATION'));

/**
*
* Database settings
* This file will be renamed to SettingsConfig.php in subsequent versions
*
*/
$app = new \Slim\App([
    'settings' => [
        'displayErrorDetails' => true,
    //Database definition
    'db' => [
        'driver' => 'mysql',
        'host'=> DB_HOST,
        'database' => DB_NAME,
        'username' => DB_USER,
        'password' => DB_PASSWORD,
        'port' => DB_PORT,
        'charset' => DB_CHARSET,
        'collation' => DB_COLLATION,
        'prefix' => '',
    ],
    'cakeDB' => [
        'className' => 'Cake\Database\Connection',
        'driver' => 'Cake\Database\Driver\Mysql',
        'database' => DB_NAME,
        'username' => DB_USER,
        'password' => DB_PASSWORD,
        'cacheMetadata' => false // If set to `true` you need to install the optional "cakephp/cache" package.

    ]
  ]
]);