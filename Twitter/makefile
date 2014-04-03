all: NewsLinks.sh

ipinfo.txt:
	wget http://www.ip2location.com/ -O ipinfo.txt -o /dev/null

LatLong.txt: ipinfo.txt
	cat ipinfo.txt | egrep "for=\"chkLatLng\"" | egrep -o '[+|-][0-9]*\.[0-9]*, [+|-][0-9]*\.[0-9]*' | sed "s/^\([^,]*\), \(.*\)$$/'trends\/closest' 'lat' '\1' 'long' '\2/">$@

closest.txt: LatLong.txt
	php callAPI.php LatLong.txt

woeid.txt: closest.txt
	cat closest.txt | egrep 'woeid' | egrep -o '[0-9]*$$' | sed "s/\([0-9]*\)/\'trends\/place\' \'id\' \'\1/" > $@

place.txt: woeid.txt
	php callAPI.php woeid.txt

trends.txt: place.txt
	bash trends.sh > $@

wgetsGoogle.sh: place.txt
	bash googleNews.sh > $@
	bash wgetsGoogle.sh

LinkAggregator.txt: trends.txt wgetsGoogle.sh
	cat trends.txt | sed 's/\(^.*$$\)/cat \"Trends\/\1.txt\"/' | sed "s/cat \"Trends\/\(.*$$\)/cat \"Trends\/\1 | egrep -o \'\"http:\/\/[^\\\\\"]*\"\' | egrep -viw 'google|youtube|favicon|googlenewsblog' | uniq >\"News for \1/" > $@

NewsLinks.sh: LinkAggregator.txt
	cat LinkAggregator.txt | sed 's/#//g' > $@
	bash NewsLinks.sh
	mv News\ for\ * NewsLinks/

clean:
	rm -f ipinfo.txt LatLong.txt closest.txt woeid.txt place.txt trends.txt wgetsGoogle.sh Trends/*.txt LinkAggregator.txt NewsLinks.sh NewsLinks/*.txt