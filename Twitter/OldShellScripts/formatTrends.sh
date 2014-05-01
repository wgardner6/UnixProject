cat closest.txt | egrep 'name.*$' | egrep -o '>.*$' | sed 's/> //g' | head -1 | sed 's/\(^.*$\)/Currently trending for \1\:/'
cat trends.txt
