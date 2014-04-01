#Locates user
bash GeoLoc.sh
#Calls the API to get closest supported WOEID
php callAPI.php LatLong.txt #'trends/closest' 'lat' '37.781157' 'long' '-122.4006128'
#Formats woeid for use by trends/place
bash woeid.sh > woeid.txt
#Call Twitter API to determine the trending words for a specific woeid
php callAPI.php woeid.txt
#Saves all the trends into a text file
bash trends.sh > trends.txt
#Output the trending data for specific place
bash formatTrends.sh
#Saves all the trends into appropriate wget calls
bash googleNews.sh
#Calls wget on all the trend searches
bash wgetsGoogle.sh
#Aggregates and formats all the trends to be Googled for
bash googleLinks.sh
#Has all the links to search google for
bash LinkAggregator.sh
mv News\ for\ * NewsLinks/

