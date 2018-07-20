# Association Rule
dataar1 = read.csv("dar1.csv")
str(dataar1)
?write.csv
write.csv(dataar1,file='dar1w.csv',row.names = F)
(dataar1 = dataar1[-7])
library(arules)
str(dataar1)
# change to factors for Association Rule
#dataar1 = lapply(dataar1,function(x) as.factor(x))
rules = apriori(dataar1)
inspect(rules)
rules
# more than 300 rules generated
# Refining Rules
rhsrule = c('java=Yes','cpp=Yes')
rules = apriori(dataar1, parameter = list(minlen=2,supp=.05,conf=0.8),
                list(rhs=rhsrule,default="lhs"), control=list(verbose=F))
rules.sorted = sort(rules,by='lift')
inspect(rules.sorted)

# Prune Redundant Rules
subset.matrix = is.subset(rules.sorted,rules.sorted)
subset.matrix
subset.matrix[lower.tri(subset.matrix,diag=T)] = NA
subset.matrix
redundant <- colSums(subset.matrix,na.rm=T) >=1
subset.matrix
redundant
which(redundant)
rules.pruned = rules.sorted[!redundant]
inspect(rules.pruned)
# Visualising
library(arulesViz)
plot(rules)
plot.new()
plot(rules,method='graph',control=list(type='items'))
plot(rules,method='paracoord',control=list(reorder=T))

# Using Weka Library ####
#Using Weka 
library(RWeka)
library(rattle)
rattle()
Apriori()