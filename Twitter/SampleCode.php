<?php
 
/* Load required lib files. */
require_once('twitteroauth/twitteroauth/twitteroauth.php'); 
require_once('twitteroauth/config.php');

$twitter = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, OAUTH_TOKEN, OAUTH_TOKEN_SECRET);

$connection->host = "https://api.twitter.com/1.1/";
$connection->ssl_verifypeer = TRUE;
 
$tweets = $twitter->get('trends/place',array('id'=>2486982));
echo serialize(array('id'=>2486982));


print_r($tweets);