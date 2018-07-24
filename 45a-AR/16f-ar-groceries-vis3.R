# AR - Visualisation - Matrix

library(arules)
library(datasets)
data(Groceries)
library(arulesViz)
rules <- apriori(Groceries, parameter = list(support=.001, confidence=.7,
                                             maxlen=5, target='rules' ))


#Matrix-based visualization techniques organize the antecedent and consequent itemsets on the x and y-axes, respectively. A selected interest measure is displayed at the intersection of the antecedent and consequent of a given rule. If no rule is available for a antecedent/consequent combination the intersection area is left blank.

subrules <- rules[quality(rules)$confidence > 0.8]
subrules
inspect(subrules)
plot(subrules, method = "matrix", measure = "lift")

# not much space for long labels in the plot, we only show numbers as labels for rows and columns and the complete itemsets are printed to the terminal for look-up

plot(subrules, method = "matrix3D", measure = "lift")



#Grouped matrix-based visualization
#Matrix-based visualization is limited in the number of rules it can visualize effectively since large sets of rules typically also have large sets of unique antecedents/consequents.
summary(rules)
plot(rules, method = "grouped")

plot(rules, method = "grouped", control = list(k = 50))

sel <- plot(rules, method = "grouped", interactive = TRUE)
