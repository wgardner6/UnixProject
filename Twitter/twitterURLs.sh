cat place.txt | egrep -w 'url|name' | egrep -o '>.*$' | sed 's/> //g' |sed 's/#//' | head -20 > "TwitterHeadlines.txt"
