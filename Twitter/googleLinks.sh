cat trends.txt | sed 's/\(^.*$\)/cat \"Trends\/\1.txt\"/' | sed "s/cat \"Trends\/\(.*$\)/cat \"Trends\/\1 | egrep -o \'href=\"http:[^\\\\\"]*\' | egrep -viw 'google|youtube|favicon|googlenewsblog'>\"News for \1/" > LinkAggregator.sh

