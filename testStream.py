from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener
import time
import sys
ckey = 'ktehXbgqvORStvmxSNpNDA'
csecret = 'N0fs05UqLMl397tWObSbTx33e4d4026LLSHxyI4'
atoken = '2353689793-NmDEMVCL8AgLndmQeqhyeCk7sBWPuq74QfAjQUf'
asecret = 'Zqlv5MsT1XDRZN1aigTbhTfJ1OIVxC9DEU46e594jTExB'
counter = 0
search = str(sys.argv[1])
class listener(StreamListener):
    def on_data(self, data):
        try:
            #print data
            tweet = data.split(',"text":"')[1].split('","source')[0]
            print tweet
            saveThis = str(time.time())+':::'+tweet
            
            global counter
            counter+=1;
            if counter>=20:
                return False
            txt = search+'tweets.txt'
            saveFile = open(txt,'a')
            saveFile.write(saveThis)
            saveFile.write('\n')
            saveFile.close()
            return True
        except BaseException, e:
            print 'Failed ondata,',str(e)
            time.sleep(5)

    def on_error(self, status):
        print status
try:
    auth = OAuthHandler(ckey, csecret)
    auth.set_access_token(atoken, asecret)
    twitterStream = Stream(auth, listener())
    twitterStream.filter(track=[search])
except BaseException, e:
    print 'Failed in main,',str(e)
    time.sleep(5)
