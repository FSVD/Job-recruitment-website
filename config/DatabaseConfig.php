<?php

require('../vendor/autoload.php');

$dotenv = Dotenv\Dotenv::create('../');
$dotenv->load();

$host = getenv('HOST');
$database = getenv('DATABASE');
$username = getenv('USERNAME');
$password = getenv('PASSWORD');

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
        'host'=> $host,
        'database' => $database,
        'username' => $username,
        'password' => $password,
        'charset' => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix' => '',
    ],
    'cakeDB' => [
        'className' => 'Cake\Database\Connection',
        'driver' => 'Cake\Database\Driver\Mysql',
        'database' => $database,
        'username' => $username,
        'password' => $password,
        'cacheMetadata' => false // If set to `true` you need to install the optional "cakephp/cache" package.

    ]
  ]
]);
