#Creates the wget calls for the trends 
cat place.txt | egrep 'name' | egrep -o '> .*$' | sed 's/[>| |#]*\(.*\)/\1/g' | sed 's/\(.*$\)/wget \"https:\/\/news.google.com\/?q=\1\" -O \"Trends\/\1.txt\" -o \/dev\/null/'


