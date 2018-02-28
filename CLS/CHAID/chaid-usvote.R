#CHAID1

### fit tree to subsample

set.seed(290875)
data(USvote)
?USvote
names(USvote)
summary(USvote)

USvoteS = USvote[sample(1:nrow(USvote), 1000),]

ctrl <- chaid_control(minsplit = 200, minprob = 0.1)

chaidUS <- chaid(vote3 ~ ., data = USvoteS, control = ctrl)

summary(chaidUS)
print(chaidUS)
plot(chaidUS)
