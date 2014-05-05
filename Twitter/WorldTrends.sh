echo "'trends/place' 'id' '1" >worldWoeid.txt
php callAPI.php worldWoeid.txt
bash twitterURLs.sh > worldTrends.txt
