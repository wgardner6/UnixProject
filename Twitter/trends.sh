#Finds the local tends
cat place.txt | egrep 'name' | egrep -o '> .*$' | sed 's/> //g' | head -10
