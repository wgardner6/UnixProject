<?php
 
/* Load required lib files. */
session_start();

//Add Twitter library by https://github.com/abraham/twitteroauth
require_once('twitteroauth/twitteroauth/twitteroauth.php'); 
//Add config file which contains tokens for API calls
require_once('twitterTokens/config.php');

//Unset variables
unset($connection);
unset($twitterReturn);

//Get data from file
$Data = file_get_contents($argv[1]);

//Initialize data array
$Data_Array = array();

//Strtok the $Data
$tok = strtok($Data, " '");

//Store each new string from data file into $Data_Array
while ($tok !== false) {
  //echo "Word=$tok\n";
  $Data_Array[]=$tok;
  $tok = strtok(" '");
}

//Initialize new TwitterOAuth connection using tokens read in from config
$connection = new TwitterOAuth (CONSUMER_KEY, CONSUMER_SECRET, OAUTH_TOKEN, OAUTH_TOKEN_SECRET); 

//Redirect host to API v1.1
$connection->host = "https://api.twitter.com/1.1/";

//Add ssl verification
$connection->ssl_verifypeer = TRUE;

//Initialize options array to pass queries to API
$options = array();

//Add options to query array using keys and values of array
for($i = 1; $i <= count($Data_Array)-1; $i=$i+2){
       if (strcmp($Data_Array[$i],"id")==0){
	 //If you want to pass in an id it must be an int so this casts it
	   $Data_Array[$i+1] = (int)$Data_Array[$i+1];
	 }
       //Add values with specific keys such as lat=>...
       $options[$Data_Array[$i]] = $Data_Array[$i+1];
}
//Get connection
$twitterReturn = $connection->get($Data_Array[0], $options);

//Determine file name after first / such as "trends/place"
$ftok = strtok($Data_Array[0]," /");
$file = substr($Data_Array[0],strlen($ftok)+1);
//Put contents of twitterReturn into file
file_put_contents($file.'.txt',print_r($twitterReturn,true));
