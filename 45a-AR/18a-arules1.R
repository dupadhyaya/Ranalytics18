# Documentation on arules

library(arules)





#----



#----


#significant
data("Income")
rules <- apriori(Income, parameter = list(support = 0.5))
is.significant(rules, Income)
inspect(rules[is.significant(rules, Income)])

