# Groceries Example 2 ####

library(arules)  #install first
library(arulesViz) #install first
library(datasets)  # no need to install, just load it
data('Groceries')

str(Groceries)
Groceries
inspect(Groceries[1:5])  #view

LIST(Groceries[1:6])  #another view

#Lets Apply Apriori Algorithm
frequentItems <- eclat (Groceries, parameter = list(supp = 0.005, minlen= 1, maxlen = 5)) 
frequentItems
inspect(frequentItems[1:5])
inspect(sort (frequentItems, by="count", decreasing=TRUE)[1:5])
#support(A&B) = n(A&B)/ N

frequentItems
inspect(frequentItems[1:5])
inspect(frequentItems)

?eclat
itemFrequencyPlot(Groceries,topN = 15,type="absolute")
itemFrequencyPlot(Groceries, topN = 10, type='relative')
abline(h=0.2)

rules <- apriori(Groceries, parameter = list(supp = 0.005, conf = 0.5))
rules
#write.csv(inspect(rules[1:5]), 'rules.csv')
inspect(rules[1:5])
quality(rules) 
head(quality(rules))
options (digits=2)
inspect (rules[1:5])
rulesc <- sort (rules, by="confidence", decreasing=TRUE)
inspect(rulesc[1:5])
rulesl <- sort (rules, by="lift", decreasing=TRUE)
inspect (rulesl[1:5])

#How To Control The Number Of Rules in Output ?
rules <- apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, maxlen=3)) # maxlen = 3 limits the elements in a rule to 3

#How To Remove Redundant Rules ?
sum(is.redundant(rules))
(redundant = which(is.redundant(rules)))
#colSums(is.subset(rules, rules))
rulesNR <- rules[-redundant] 
is.redundant(rulesNR)
sum(is.redundant(rulesNR))  #ok now

#Another method
#redundant <- which (colSums (is.subset (rules, rules)) > 1) 
#redupndant



#Find what factors influenced an event ‘X’
rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.08), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F))
inspect(rules[1:15])

#Find out what events were influenced by a given event

rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.05,minlen=2), appearance = list (default="rhs",lhs="whole milk"), control = list (verbose=F)) 
inspect(rules)
#Visualizing The Rules -----
plot (rules, measure=c("support", "lift"), shading="confidence")

#plot(rules[1:5],method="graph",engine='interactive', shading="confidence") 

