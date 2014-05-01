all: NewsLinks.sh

#Generates the IP address for the current user

ipinfo.txt:
	wget http://www.ip2location.com/ -O ipinfo.txt -o /dev/null

#Take the text from the IP address finder and convert it to a lat long structure that can be read by the php script

LatLong.txt: ipinfo.txt
	cat ipinfo.txt | egrep "for=\"chkLatLng\"" | egrep -o '[+|-][0-9]*\.[0-9]*, [+|-][0-9]*\.[0-9]*' | sed "s/^\([^,]*\), \(.*\)$$/'trends\/closest' 'lat' '\1' 'long' '\2/">$@

#Run the php script with the LatLong info to get the closest source for trending data

closest.txt: LatLong.txt
	php callAPI.php LatLong.txt

#Finds the woeid from the output of the API call

woeid.txt: closest.txt
	cat closest.txt | egrep 'woeid' | egrep -o '[0-9]*$$' | sed "s/\([0-9]*\)/\'trends\/place\' \'id\' \'\1/" > $@

#Calls the Twitter API in search of trends according to a specific woeid

place.txt: woeid.txt
	php callAPI.php woeid.txt

#Finds the trends and saves them in a text file
#Finds the URLs for the trends on twitter

trends.txt: place.txt
	bash trends.sh > $@
	bash twitterURLs.sh > TwitterHeadlines.txt

#Generates Google wgets in order to collect URLs for news articles
#Calls Google to generate news article links for each trend

wgetsGoogle.sh: place.txt
	bash googleNews.sh > $@
	bash wgetsGoogle.sh

#Cleans up the calls to Google to just get the URLs that are specific to news articles and nothing else

LinkAggregator.txt: trends.txt wgetsGoogle.sh
	cat trends.txt | sed 's/\(^.*$$\)/cat \"Trends\/\1.txt\"/' | sed "s/cat \"Trends\/\(.*$$\)/cat \"Trends\/\1 | egrep -o \'\"http:\/\/[^\\\\\"]*\"\' | egrep -viw 'google|youtube|favicon|googlenewsblog' | uniq >\"News for \1/" > $@

#Cleans up the LinkAggregator and just outputs the newslinks

NewsLinks.sh: LinkAggregator.txt
	cat LinkAggregator.txt | sed 's/#//g' > $@
	bash NewsLinks.sh
	mv News\ for\ * NewsLinks/

#Removes all text files that are generated

clean:
	rm -f ipinfo.txt LatLong.txt closest.txt woeid.txt place.txt trends.txt wgetsGoogle.sh Trends/*.txt LinkAggregator.txt NewsLinks.sh NewsLinks/*.txt TwitterHeadlines.txt
