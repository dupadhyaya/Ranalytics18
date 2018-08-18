# Association Rules - Groceries data set ####

library(arules)  #install first
library(arulesViz) #install first
library(datasets)  # no need to install, just load it reqd for Groceries
data('Groceries')
Groceries

#Structure of Groceries
str(Groceries)
Groceries
inspect(Groceries[1:5])  #view
LIST(Groceries[1:6])  #another view

#Find Frequent Itemset
frequentItems = eclat (Groceries, parameter = list(supp = 0.01, minlen= 2, maxlen = 5)) 
inspect(frequentItems)
frequentItems
inspect(frequentItems[10:100])
#inspect(frequentItems[100:122])
#Descending Sort frequent items by count : 1 to 25 itemsets
inspect(sort (frequentItems, by="count", decreasing=TRUE)[1:25])
inspect(sort (frequentItems, by="count", decreasing=F)[1:25])

#Support is : support(A&B) = n(A&B)/ N
#Plot the Frequency Plot
itemFrequencyPlot(Groceries,topN = 15,type="absolute")
itemFrequencyPlot(Groceries, topN = 10, type='relative')
abline(h=0.2)

# Create rules and the relationship between items
#parameters are min filter conditions 
rules = apriori(Groceries, parameter = list(supp = 0.005, conf = 0.5))
rules
options (digits=2)
inspect (rules[1:5])

#Sort Rules by confidence, lift and see the data
rulesc <- sort (rules, by="confidence", decreasing=TRUE)
inspect(rulesc[1:5])
rulesl <- sort (rules, by="lift", decreasing=TRUE)
inspect (rulesl[1:5])
#which items have strong confidence and lift 

#How To Control The Number Of Rules in Output ?
#maxlen, minlen, supp, conf
rules2 = apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, minlen=2, maxlen=3)) 
inspect(rules2[1:5])

# Are there any duplicate/ Redundant Rules 
#https://rdrr.io/cran/arules/man/is.redundant.html

sum(is.redundant(rules2))
(redundant = which(is.redundant(rules2)))
inspect(rules2[redundant])
#inspect(subset(rules2, subset=lhs %ain% c('citrus fruit','rice') & rhs %in% 'whole milk' ))
#remove it
rulesNR = rules2[-redundant] 
is.redundant(rulesNR)
sum(is.redundant(rulesNR))  #ok now



#Find what factors influenced an event ‘X’
rules3 = apriori (data=Groceries, parameter=list (supp=0.002,conf = 0.8), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F))
inspect(rules3[1:5])
inspect(rules3)

#Find out what events were influenced by a given event
subset1 = subset(rules2, appearance = list (default="lhs",rhs="whole milk"))
subset1 = subset(rules2, subset=rhs %in% 'bottled beer' )
inspect(subset1)
inspect(rules2)
subset2 = subset(rules2, subset=lhs %ain% c('baking powder','soda') )
inspect(subset2)
subset2a = subset(rules2, subset=lhs %in% c('baking powder','soda') )
inspect(subset2a)




subset3 = subset(rules2, subset=rhs %in% 'bottled beer' & confidence > .7, by = 'lift', decreasing = T)
inspect(subset3)
subset4 = subset(rules2, subset=lhs %in% 'bottled beer' & rhs %in% 'whole milk' )
inspect(subset4)

#Visualizing The Rules -----
plot(subset1[1:10]) 
plot(subset1[1:10], measure=c("support", "lift"), shading="confidence")

#


rules4 = apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.4), appearance = list (default="rhs",lhs=c('tropical fruit','herbs')), control = list (verbose=F))
inspect(rules4[1:5])
inspect(rules4)

