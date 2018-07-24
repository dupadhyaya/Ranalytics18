#Association Rule - Visualisation

library(arules)
library(datasets)
data(Groceries)

#
rules <- apriori(Groceries,  parameter = list(support=.001,
              conf = .01, minlen=2, maxlen=2, target='rules'))

#Visually mining rules. Both rules and itemsets can be visualized with the help of arulesViz library. The power of the plot() function from arulesViz library comes from interactive argument. Remember, as a general rule we want rules with both high support and high confidence.

plot(rules, interactive = T)

#interactive-rules-choice With the help of this function we can visually mine rules by:
#1. Selecting rectangular area by clicking twice on the plot.
#2. Then clicking inspect

#This would produce rules found in that region, e.g.:



inspectDT(rules)
 