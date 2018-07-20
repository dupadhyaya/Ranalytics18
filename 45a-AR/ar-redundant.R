# Redundant Rules
# 

# Case 1: Income ----
data("Income")

## mine some rules with the consequent "language in home=english"
rules <- apriori(Income, parameter = list(support = 0.5), appearance = list(rhs = "language in home=english", default = "lhs"))
inspect(rules[1:5])

## comparison :sort the rules by confidence and add Bayado's improvement
rules2 <- sort(rules, by = "confidence")
quality(rules2)$improvement <- interestMeasure(rules2, measure = "improvement")
inspect(rules2)
is.redundant(rules2)

## redundant rules
inspect(rules2[is.redundant(rules2)])

## non-redundant rules
inspect(rules2[!is.redundant(rules2)])



#Case-2 :
transactions = Groceries
rules<-apriori(transactions,parameter = list(support=0.001,confidence=0.8,minlen=3))
rules
summary(rules)
rules
#Method_1
subset.matrix <- is.subset(rules,rules)
subset.matrix[lower.tri(subset.matrix,diag=T)] <- NA
redundant <- colSums(subset.matrix,na.rm=T) >= 1
redundant
rules[which(redundant)]
rules2 <- rules[!redundant]
rules2
rules[redundant]

#Method_2
is.redundant(rules)
inspect(rules[!is.redundant(rules)])



#Method X ----

subsetRules <- which(colSums(is.subset(rules, rules)) > 1) # get subset rules in vector
length(subsetRules)  #> 3913
rules <- rules[-subsetRules] # remove subset rules. 
