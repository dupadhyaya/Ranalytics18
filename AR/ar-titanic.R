# Association Rule Example 1 ####
#http://www.rdatamining.com/examples/association-rules
load("./data/titanic.raw.rdata")
titanic1 = titanic.raw
str(titanic1)

#write.csv(titanic.raw,file="titanic.csv")
titanic2 = read.csv("./data/titanic.csv")
str(titanic2)

titanic = titanic1
head(titanic)
#titanic = titanic[-1]  # not reqd from rdata
head(titanic)
str(titanic)

library(arules)

rules = apriori(titanic, control=list(verbose=F))
rules = apriori(titanic)

options(digits=3)
inspect(rules)
rules
inspect(rules[1:5])
quality(rules) = round(quality(rules), digits=3)
quality(rules[1:5])

rules = apriori(titanic, parameter = list(minlen=2,supp=.005,conf=0.8),  list(rhs=c("Survived=No","Survived=Yes"),default="lhs"), control=list(verbose=F))

rules.sorted = sort(rules, by="lift")

inspect(rules.sorted[1:5])

options(digits=2)


# Prune Redundant
rules.pruned <- rules[!is.redundant(rules)]
rules.redundant <- rules[is.redundant(rules)]
?is.redundant
inspect(rules.pruned)
rules.pruned
inspect(rules.redundant)
rules.pruned.sorted = sort(rules.pruned, by="lift")
inspect(rules.pruned.sorted)

# Visualising
library(arulesViz)
plot(rules.pruned.sorted)

plot(rules.pruned.sorted, method="graph", control=list(type="items"))

plot(rules.pruned.sorted, method="paracoord", control=list(reorder=TRUE))

