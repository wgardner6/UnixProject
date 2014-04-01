#Locates user
echo Calling GeoLoc
bash GeoLoc.sh
#Calls the API to get closest supported WOEID
echo Calling API with LatLong
php callAPI.php LatLong.txt 
#Formats woeid for use by trends/place
echo Calling woeid.sh
bash woeid.sh > woeid.txt
#Call Twitter API to determine the trending words for a specific woeid
echo Calling API with woeid
php callAPI.php woeid.txt
#Saves all the trends into a text file
echo Calling trends to save as txt
bash trends.sh > trends.txt
#Output the trending data for specific place
echo Sending trends to command line
bash formatTrends.sh
#Saves all the trends into appropriate wget calls
echo Calling googleNews
bash googleNews.sh
#Calls wget on all the trend searches
echo Calling wgetsGoogle
bash wgetsGoogle.sh
#Aggregates and formats all the trends to be Googled for
echo Calling googleLinks
bash googleLinks.sh
#Has all the links to search google for
echo Calling LinkAggregator
#bash LinkAggregator.sh
#Removing weird #s in LinkAggregator
echo 'Removing #'
cat LinkAggregator.txt | sed 's/#//g' > NewsLinks.sh
#Searches google for newslinks relating to trending topics
echo Calling NewsLinks
bash NewsLinks.sh
mv News\ for\ * NewsLinks/

