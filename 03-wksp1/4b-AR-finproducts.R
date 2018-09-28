# AR data for Finance

library("arules")

set.seed(101)
transactionID = sample(1:500, 1000, replace=T)
transactionID

finproducts = c('Mutual Funds', 'NPS', 'Savings Account', 'PPF', 'FD', 'Bonds', 'Stocks', 'General Insurance', 'NRI Banking', 'Car Insurance', 'Debit Card', 'Credit Card', 'Mobile Banking')
length(finproducts)
item = sample(finproducts,1000, replace=T)
item
orders = data.frame(transactionID, item)
head(orders)

write.csv(orders, "./data/fintransactions.csv")

ordertrans <- arules::read.transactions(
  file = "./data/fintransactions.csv",  format = "single",
  sep = ",",  cols=c("transactionID","item"),  rm.duplicates = T
)
inspect(ordertrans[1:5])
ordertrans
summary(ordertrans)
str(ordertrans)
head(ordertrans)


#find frequent item set
frequentItems <- eclat (ordertrans, parameter = list(supp = 0.005, minlen= 2, maxlen = 5)) 
inspect(frequentItems[1:10])
inspect(sort (frequentItems, by="count", decreasing=TRUE)[1:15])
#support(A&B) = n(A&B)/ N

frequentItems

itemFrequencyPlot (ordertrans,topN = 15,type="absolute")
itemFrequencyPlot(ordertrans, topN = 10, type='relative')
abline(h=0.15)

#Create Rules
rules1 <- arules::apriori(ordertrans, parameter = list(supp = 0.005, conf = 0.5))
rules1
write.csv(inspect(rules1, 'rules.csv'))
inspect(rules1[1:5])

rules1L = sort (rules1, by="lift", decreasing=TRUE)
inspect (rules1L[1:5])


#How To Control The Number Of Rules in Output ?
rules2 = apriori (ordertrans, parameter = list (supp = 0.005, conf = 0.5, minlen=3, maxlen=5)) # minlen = 3 & maxlen limits the elements in a rule to 3 & 5
inspect(rules2)

rules3 = apriori(ordertrans)  #use default values  no rules


#Find what factors influenced an event ‘X’


rules4 <- apriori(data=ordertrans, parameter=list (supp=0.001,conf = 0.08), appearance = list (default="lhs",rhs="Credit Card"), control = list (verbose=F))  #verbose=F no log
inspect(rules4[1:15])

#Find out what events were influenced by a given event
rules5 <- apriori (data=ordertrans, parameter=list (supp=0.001,conf = 0.05,minlen=2), appearance = list (default="rhs",lhs="General Insurance"), control = list (verbose=F)) 
inspect(rules5)

inspect( subset( rules5, subset = rhs %pin% c("Bonds") ))
inspect( subset( rules5, subset = rhs %pin% c("FD") ))


#Control lhs and rhs
rules6 <- apriori(ordertrans, parameter=list(support =0.00001, confidence =0.05, minlen=2, maxlen=5), appearance = list(lhs=c("Debit Card"), rhs=c("Credit Card"), default="none"))
inspect(rules6)

# commands for subset 
# lhs - means left hand side, or antecendent
# rhs - mean right hand side, or consequent
# items - items, that make up itemsets
# %in% - matches any
# %ain% - matches all
# %pin% - matches partially
# default - no restrictions applied
# & - additional restrictions on lift, confidence etc.

inspect(subset(rules1, subset=items %ain% c("Mobile Banking") & confidence >.95))
inspect(subset(rules1, subset=lhs %ain% c("Mobile Banking") & confidence >.9))

inspect(subset(rules1, subset= lhs %pin% "Debit Card" & rhs %in% "Savings Account" & confidence > .7))

#Export Rules into a table
library(data.table)
rules_dt <- data.table( lhs = labels( lhs(rules2) ), 
                        rhs = labels( rhs(rules2) ), 
                        quality(rules2) )[ order(-lift), ]
rules_dt
DT::datatable(rules_dt)  # wrapper for datatables
write.csv(rules_dt, './data/arulesfin.csv')


#Visualizing The Rules -----
library(arulesViz)
inspect(rules1)
plot(rules1, measure=c("support", "lift"), shading="confidence")
plot(rules1, measure=c("support", "confidence"), shading="lift")

plot(rules1,method="graph",engine='interactive', shading="confidence") 

