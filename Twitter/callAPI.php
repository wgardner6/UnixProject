<?php
 
/* Load required lib files. */
session_start();
require_once('twitteroauth/twitteroauth/twitteroauth.php'); 
require_once('twitteroauth/config.php');

$connection = new TwitterOAuth (CONSUMER_KEY, CONSUMER_SECRET, OAUTH_TOKEN, OAUTH_TOKEN_SECRET); 

$connection->host = "https://api.twitter.com/1.1/";
$connection->ssl_verifypeer = TRUE;
print_r($argc);
print_r("\n\n");

$options = array();
for($i = 2; $i <= $argc-1; $i=$i+2){
       print($argv[$i]."\n");
       $options[$argv[$i]] = $argv[$i+1];
}

print_r(array($argv[2] => $argv[3], $argv[4] => $argv[5]));


print_r($options);

$statuses = $connection->get($argv[1], $options);


print_r($statuses);

file_put_contents('location.txt',serialize($statuses));