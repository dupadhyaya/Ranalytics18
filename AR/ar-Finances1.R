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
inspect(frequentItems[1:20], by='support', decreasing=F)  #view by support increasing order
inspect(frequentItems)  #view all

itemFrequencyPlot (ordertrans,topN = 15,type="absolute")
itemFrequencyPlot(ordertrans, topN = 10, type='relative')
abline(h=0.15)

rules1 <- arules::apriori(ordertrans, parameter = list(supp = 0.005, conf = 0.5))
rules1
write.csv(inspect(rules1, 'rules.csv'))
inspect(rules1[1:5])
quality(rules1) 
head(quality(rules1))
options (digits=2) # set no of digits
inspect (rules1[1:5])
rules1C = sort (rules1, by="confidence", decreasing=TRUE)
inspect(rules1C[1:5])
rules1L = sort (rules1, by="lift", decreasing=TRUE)
inspect (rules1L[1:5])
rules1S = sort (rules1, by="support", decreasing=TRUE)
inspect (rules1S[1:5])
rules1N = sort (rules1, by="count", decreasing=TRUE)
inspect (rules1N[1:5])


#How To Control The Number Of Rules in Output ?
rules2 <- apriori (ordertrans, parameter = list (supp = 0.005, conf = 0.5, minlen=3, maxlen=5)) # minlen = 3 & maxlen limits the elements in a rule to 3 & 5
inspect(rules2)

rules3 = apriori(ordertrans)  #use default values  no rules
rules3 = apriori(ordertrans, parameter=list(support=0.002))  #use default values  no rules

#How To Remove Redundant Rules ?
#A->B, C->B, A&C ->B  : Then A&C -> B is redundant if value of life <= 1st two
#A,B,C -> D; A&B -> D having same sp & conf : has lower lift
is.redundant(rules3)
sum(is.redundant(rules3))
(redundant = which(is.redundant(rules3)))
inspect(rules3[redundant])
length(redundant)
inspect(rules3[redundant][1:10])
rulesNR = rules3[-redundant] 
is.redundant(rulesNR)
sum(is.redundant(rulesNR))  #ok now

#Another method union of lhs & rhs
redundant3 = which (colSums (is.subset (rules3, rules3)) > 1) 
redundant3
length(redundant3)
rules3NR = rules3[-redundant3]
inspect(rules3NR[1:10])

itemFrequency(ordertrans)
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
#extra window
plot(rules1,method="graph",engine='interactive',shading=NA)
interestMeasure(rules1, transactions=ordertrans, measure=c('support','count','lift'))
quality(rules1)
plot(rules1, shading="order", control=list(main = "Two-key plot"), col=4:6)
inspect(rules1)
plot(rules2, shading="order", control=list(main = "Two-key plot"), col=1:4)
inspect(rules2)

sel = plot(rules1, measure=c("support", "confidence"), shading="lift", engine='interactive') #use mouse to do selection
#https://cran.r-project.org/web/packages/arulesViz/vignettes/arulesViz.pdf


#Matrix Based Visualisation
subrules1 <- rules1[quality(rules1)$confidence > 0.8]
subrules1
plot(subrules1, method="matrix", measure="lift")
plot(subrules1, method="matrix", measure="lift", control=list(reorder=TRUE))
plot(subrules1, method="matrix", engine='3d', measure="lift")

# Group based
plot(rules1, method="grouped")

plot(subrules1, method="graph", control=list(type="itemsets"))

plot(subrules1, method="paracoord")
plot(rules1[1], method="doubledecker", data = ordertrans)
#The area of blocks gives the support and the height of the “yes” blocks is proportional to the confidence for the rules consisting of the antecedent items marked as “yes.”
