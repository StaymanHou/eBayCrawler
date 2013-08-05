<?php
// database connection and schema constants
define('DB_HOST', '127.0.0.1');
define('DB_USER', 'MyUser');
define('DB_PASSWORD', 'ZwV2pZJrVWNG5t3W');
define('DB_SCHEMA', 'MyUser_eBaySellerData');

// establish a connection to the database server
if (!$GLOBALS['DB'] = mysql_connect(DB_HOST, DB_USER, DB_PASSWORD))
{
    die('Error: Unable to connect to database server.');
}
if (!mysql_select_db(DB_SCHEMA, $GLOBALS['DB']))
{
    mysql_close($GLOBALS['DB']);
    die('Error: Unable to select database schema.');
}
?>
