#AR - Groceries - Subset

#Subsetting rules and itemsets
rules <- apriori(Groceries, parameter = list(support=.001, confidence=.7,   maxlen=5, target='rules' ))
rules
#target='rules' # to mine for rules)

inspect(sort(rules, by="confidence", decreasing = T)[1:5])

#subset conditions
#rhs should be ‘bottled beer’
#confidence should be above .7
#results should be sorted by lift

#Subset1----
inspect(sort(subset(rules, subset=rhs %in% 'bottled beer' & confidence > .7),   by = 'lift', decreasing = T))

#people buying “liquor” and “red wine” are almost certain to buy “bottled beer” (9 times out of 10), but not “canned beer”

# Another rule with different parameters
#subset2----
canned_rules <- apriori(Groceries,parameter = list(support=.001,  confidence=.01, maxlen=5, target='rules' ))

inspect(subset(canned_rules, subset=lhs %ain% c("liquor", "red/blush wine") & rhs %in% 'canned beer' ))
#no rule found or it could be significant low % less than 1 in 100 people would do

#legend to condition commands 
# lhs - means left hand side, or antecendent
# rhs - mean right hand side, or consequent
# items - items, that make up itemsets
# %in% - matches any
# %ain% - matches all
# %pin% - matches partially
# default - no restrictions applied
# & - additional restrictions on lift, confidence etc.

#either side lhs or rhs
#“whole milk” and “yogurt” must be present and rule’s confidence must be higher than .95
#subset3----
inspect(subset(rules, subset=items %ain% c("whole milk","yogurt") & confidence >.95))

#whole milk” and “yogurt” must be present in lhs and rule’s confidence must be higher than .9
inspect(subset(rules, subset=lhs %ain% c("whole milk","yogurt") & confidence >.9))

#Subset4----
#“Bread” must be present in lhs: any type of “bread” – “white bread”, “brown bread” – both qualify. “Whole milk” must be present in rhs “as is”. confidence of the rule must be higher than .9

inspect(subset(rules, subset= lhs %pin% "bread" & rhs %in% "whole milk" & confidence > .9))


#Subset5----
#what we can expect at rhs with confidence higher than .7 if we have both “flour” and “whole milk” on the lhs
inspect(subset(rules, subset= lhs %ain% c("flour","whole milk") & confidence>.7))



#Let’s consider case “Bottled beer Vs. Canned beer” and prove that people tend to buy either one or the other, and rarely do they buy both, qualifying these two as substitute products.
rules <- apriori(Groceries,  parameter = list(support=.001, conf = .01, minlen=2, maxlen=2, target='rules'))

#Let’s only look at the rules where “beer” is present at both left- and right-hand-side of the rule and add chiSquared p-value to prove statistical significance of our findings:

inspect(subset(rules, lhs %pin% 'beer' & rhs %pin% 'beer'))

crossTable(Groceries)['canned beer','bottled beer']

#the probability of a consecutive purchase (confidence) is pretty small: ~3%
#this is despite both bottled beer and canned beer being pretty popular purchases
eclat(Groceries, maxlen=1)
singleitems = eclat (Groceries, parameter = list(supp = 0.05, maxlen = 2)) 
inspect(singleitems)
inspect(sort (singleitems, by="count", decreasing=TRUE)[1:25])

crossTable(Groceries)['canned beer','canned beer']
crossTable(Groceries)['bottled beer','bottled beer']

crossTable(Groceries)['bottled beer','canned beer']
crossTable(Groceries)['canned beer','bottled beer']

quality(rules)$chi  <- interestMeasure(rules, measure='chi', significance=T, Groceries)
quality(rules)$chi[4785:4786]
#All these figures, combined with statistically significant lift below 1 (chi ~ 1e-6) tells us that “bottled beer” and “canned beer” do behave as substitutes.

