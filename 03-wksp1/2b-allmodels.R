# All models
library(dplyr)

#Linear Regression
head(women)
head(mtcars)
#predict weight for new height
plot(women)
plot(women, ylim=c(0, 160), xlim=c(0,90))
fit1 = lm(weight ~ height, data=women)
summary(fit1)
range(women$height)
(ndata1=data.frame(height=c(59.5, 62.5)))
(predicted1 = predict(fit1, newdata= ndata1))
cbind(ndata1, predicted1)
plot(fit1) #check for assumptions
par(mfrow=c(2,2))
plot(fit1)
par(mfrow=c(1,1))


#Logistic Regression
data2 = read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
head(data2)
str(data2)
summary(data2)
data2$rank = factor(data2$rank)
data2$admit = factor(data2$admit)
table(data2$rank, data2$admit) #2 way table
xtabs(~admit + rank, data = data2)
#create Logistic Model
fit2 <- glm(admit ~ gre + gpa + rank,data=data2,family="binomial")
summary(fit2)
(ndata2 = sample_n(data2, 3))  #pick up sample rows
#Predict admit for input data
(predicted2=predict(fit2,newdata=ndata2, type="response"))
(predictedclass2=ifelse(predicted2 > .5, 1,0))
cbind(ndata2, predicted2, predictedclass2)

#Data Partition




#Decision Tree - Classification 
url3 = 'https://raw.githubusercontent.com/thomaspernet/data_csv_r/master/data/titanic_csv.csv'
data3a = read.csv(url3)
head(data3a)
names(data3a)
data3 = data3a[,c(2,3,5,6,7)]  #select few columns only
head(data3)

#install & load libraries
library(rpart)
library(rpart.plot)

#Decision Tree
fit3 = rpart(survived ~ ., data = data3, method = 'class')
fit3
rpart.plot(fit3, extra = 106, cex=.8,nn=T)  #plot
printcp(fit3) #select complexity parameter
prunetree3 = prune(fit3, cp=.014) #make tree smaller
rpart.plot(prunetree3, cex=.8,nn=T)
prunetree3
table(data3$survived)
#Predict class category or probabilities
(ndata3 = sample_n(data3,4))
predicted3 = predict(prunetree3, newdata=ndata3, type='class')
predicted3b= predict(prunetree3, newdata=ndata3, type='prob')
cbind(ndata3, predicted3, predicted3b)

#similarly Regression Tree can be made



#Clustering----
#install.packages("amap")
##Read the data in the file
url4 = 'https://docs.google.com/spreadsheets/d/1PWWoMqE5o3ChwJbpexeeYkW6p4BHL9hubVb1fkKSBgA/edit#gid=2073914016'
library(gsheet)
data4 = as.data.frame(gsheet2tbl(url4))
head(data4)
summary(data4)
str(data4)
nrow(data4)
###Verify the data
colnames(data4)
apply(data4, 2, FUN= class)  #are all numeric
fit4 = kmeans(data4[,-1],centers=3)
fit4$centers  # group means
fit4$size  #how rows in which cluster
fit4$withinss  #math difference within each cluster; Which is more cohesive gp?
fit4$cluster
table(fit4$cluster)
cluster2 = data4[ fit4$cluster == 2,]
head(cluster2)
cluster2[-1] %>% summarise_all(mean)
write.csv(cluster2, file = "./data/data4cluster2.csv")


## Association Rules - Groceries data set----
library(arules)  #install first
library(arulesViz) #install first
library(datasets)  # no need to install, just load it reqd for Groceries
data('Groceries')
Groceries
arules::LIST(Groceries[1:6]) #different format
#Find Frequent Itemset
frequentItems = eclat(Groceries,parameter=list(supp = 0.01,minlen=3, maxlen=5)) 
inspect(frequentItems[1:10])
frequentItems
inspect(sort(frequentItems,by="count",decreasing=TRUE)[1:25])

#Support is : support(A&B) = n(A&B)/ N
#Plot the Frequency Plot
itemFrequencyPlot(Groceries,topN = 15,type="absolute")
itemFrequencyPlot(Groceries, topN = 10, type='relative')
abline(h=0.15)

# Create rules and the relationship between items
#parameters are min filter conditions 
rules = apriori(Groceries, parameter = list(supp = 0.001, conf = 0.5, minlen=2))
rules
inspect (rules[1:5])
#Sort Rules by confidence, lift and see the data
rulesc <- sort (rules, by="confidence", decreasing=TRUE)
inspect(rulesc[1:5])
#similary it can be done for lift and support
#which items have strong confidence and lift 

#How To Control The Number Of Rules in Output ?
#maxlen, minlen, supp, conf

#subset -----
#legend to condition commands 
# lhs - means left hand side, or antecendent
# rhs - mean right hand side, or consequent
# items - items, that make up itemsets
# %in% - matches any
# %ain% - matches all
# %pin% - matches partially
# default - no restrictions applied
# & - additional restrictions on lift, confidence etc.
#Find what factors influenced an event ‘X’ :
#Find out what events were influenced by a given event
subset1a = subset(rules, subset=rhs %in% "whole milk")
inspect(subset1a[1:10])
subset1b = subset(rules, subset=rhs %in% 'bottled beer' )
inspect(subset1b)  #no such rule with beer on rhs, change some parameters to such rules 
#inspect(rules)
#Items in : all or any
subset2a = subset(rules, subset=lhs %ain% c('baking powder','soda') )
inspect(subset2a) #all items in 1 rule
subset2b = subset(rules, subset=lhs %in% c('baking powder','soda') )
inspect(subset2b[1:5]) #any of the items in the rule
#rhs- beer, confidence , sort by lift
subset3a = subset(rules, subset=rhs %in% 'bottled beer' & confidence > .7, by = 'lift', decreasing = T)
inspect(subset3a)
subset4 = subset(rules, subset=lhs %in% 'bottled beer' & rhs %in% 'whole milk' ) # lhs- beer, rhs- milk
inspect(subset4)

#Visualizing The Rules -----
plot(subset1[1:10]) 
plot(subset1[1:10], measure=c("support", "lift"), shading="confidence")

#

#install.packages('wordcloud2')
library(wordcloud2)

df = data.frame(word=c('cbap','cmap','iim','imt','calcutta'),freq=c(20,23,15,10,13))
df
wordcloud2(df)


head(demoFreq)
wordcloud2(demoFreq, size = 2, color = "random-light", backgroundColor = "grey")
names(demoFreq)
