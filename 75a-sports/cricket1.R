# Sports Analytics
#https://gigadom.wordpress.com/2016/05/14/re-introducing-cricketr-an-r-package-to-analyze-performances-of-cricketers/
#http://www.espncricinfo.com/india/content/player/35320.html


#install.packages('cricketr') 

library(cricketr)

# Retrieve the file path of a data file installed with cricketr
pathToFile ,"Sachin Tendulkar")

# sachin - 35320

#stores players data in csv file
tendulkar <- getPlayerData(35320,dir="./sports",file="tendulkar.csv",type="batting",homeOrAway=c(1,2), result=c(1,2,4))
tendulkar <- getPlayerData(35320,dir="./sports",file="tendulkar.csv",type="batting",homeOrAway=c(1,2), result=c(1,2,4))
Sachin Tendulkar 
#Jacques Kallis http://www.espncricinfo.com/southafrica/content/player/45789.html
Ricky Ponting 
Kumara Sangakarra



?getPlayerData
tendulkar
?tendulkar

par(mfrow=c(1,3))
par(mar=c(4,4,2,2))
batsmanRunsFreqPerf(tendulkar,"Sachin Tendulkar")

batsmanRunsFreqPerf("./sports/tendulkar.csv","Sachin Tendulkar")
batsmanMeanStrikeRate("./sports/tendulkar.csv","Sachin Tendulkar")
batsmanRunsRanges("./sports/tendulkar.csv","Sachin Tendulkar")


par(mfrow=c(1,3))
par(mar=c(4,4,2,2))
batsman4s("./sports/tendulkar.csv","Tendulkar")
batsman6s("./sports/tendulkar.csv","Tendulkar")
batsmanDismissals("./sports/tendulkar.csv","Tendulkar")

battingPerf3d("./sports/tendulkar.csv","Sachin Tendulkar")
batsmanAvgRunsGround("./sports/tendulkar.csv","Sachin Tendulkar")
batsmanAvgRunsOpposition("./sports/tendulkar.csv","Tendulkar")
batsmanRunsLikelihood("./sports/tendulkar.csv","Sachin Tendulkar")
batsmanPerfBoxHist("./sports/tendulkar.csv","Sachin Tendulkar")


batsmanPerfBoxHist("./sports/kallis.csv","Jacques Kallis")