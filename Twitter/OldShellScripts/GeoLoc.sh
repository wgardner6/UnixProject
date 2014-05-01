#Gets IP Location to be used for lat long searching
wget http://www.ip2location.com/ -O ipinfo.txt -o /dev/null
#Searches the output of the ip search for lat and long and then formats to be read by the Twitter API call
cat ipinfo.txt | egrep "for=\"chkLatLng\"" | egrep -o '[+|-][0-9]*\.[0-9]*, [+|-][0-9]*\.[0-9]*' | sed "s/^\([^,]*\), \(.*\)$/\'trends\/closest\' \'lat\' \'\1\' \'long\' \'\2/">LatLong.txt
