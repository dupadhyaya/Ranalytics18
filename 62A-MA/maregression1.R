#Campaign Analysis

campaign = read.csv("./data/campaign.csv")
campaign
colSums(campaign)
sum(campaign[,-1])
summary(campaign)
(Campaignmodel<-lm(Sales~Newspaper+TV+Online, data=campaign) )

summary(Campaignmodel)

plot(Campaignmodel)

cbind(campaign, predict(Campaignmodel))

testdata = data.frame(Newspaper=500, TV=500, Online=2000)
testdata = data.frame(Newspaper=1000, TV=500, Online=2500)

predict(Campaignmodel, newdata = testdata)
9562 +(1.25*500)+(0.92*500) + (3.53*2000)
