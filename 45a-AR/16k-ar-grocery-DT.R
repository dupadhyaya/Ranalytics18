#Association Rule - Interactive Data Table

library(arules)
library(datasets)
data(Groceries)

rules <- apriori(Groceries, parameter = list(support=.002, confidence=.7,
           maxlen=5, target='rules' ))
inspectDT(rules)
#see on right side

plotly_arules(rules)# depreciated
#may not work