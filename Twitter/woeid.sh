#Searches the text file returned by the Twitter API trends/closest to determine the woeid of the nearest area with trending data. This is then formatted to be read into the API for those trending keywords
cat closest.txt | egrep 'woeid' | egrep -o '[0-9]*$' | sed "s/\([0-9]*\)/\'trends\/place\' \'id\' \'\1/"
