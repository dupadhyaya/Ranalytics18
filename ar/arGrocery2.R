# Groceries Example 2 ####

library(arules)
library(arulesViz)
library(datasets)
data('Groceries')
str(Groceries)

inspect(Groceries[1:5])
LIST(Groceries[1:5])
#Lets Apply Apriori Algorithm
frequentItems <- eclat (Groceries, parameter = list(supp = 0.07, maxlen = 15)) 
frequentItems
inspect(frequentItems)

?eclat
itemFrequencyPlot (Groceries,topN=10,type="absolute")
itemFrequencyPlot(Groceries, topN = 10)
abline(h=0.2)

rules <- apriori (Groceries, parameter = list(supp = 0.001, conf = 0.5))
rules
inspect(rules[1:5])
quality(rules) 
head(quality(rules))
options (digits=2)
inspect (rules[1:5])

rulesc <- sort (rules, by="confidence", decreasing=TRUE)
rulesl <- sort (rules, by="lift", decreasing=TRUE)
inspect (rulesl[1:5])

#How To Control The Number Of Rules in Output ?
rules <- apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, maxlen=3)) # maxlen = 3 limits the elements in a rule to 3

#How To Remove Redundant Rules ?
sum(is.redundant(rules))
(redundant = which(is.redundant(rules)))
colSums(is.subset(rules, rules))
rulesNR <- rules[-redundant] 
is.redundant(rulesNR)
sum(is.redundant(rulesNR))  #ok now

#Another method
#redundant <- which (colSums (is.subset (rules, rules)) > 1) 
#redundant


#Find what factors influenced an event ‘X’
rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.08), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F))
inspect(rules[1:5])

#Find out what events were influenced by a given event

rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.15,minlen=2), appearance = list (default="rhs",lhs="whole milk"), control = list (verbose=F)) 

#Visualizing The Rules -----

plot(rules[1:5],method="graph",engine='interactive', shading="confidence") 
plot (rules, measure=c("support", "lift"), shading="confidence")


