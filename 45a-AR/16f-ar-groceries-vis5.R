# Parallel coordinates plot

library(arules)
library(datasets)
library(arulesViz)

data(Groceries)

rules <- apriori(Groceries, parameter = list(support=.001, confidence=.7,
                                             maxlen=5, target='rules' ))
subrules2 <- head(rules, n = 10, by = "lift")
plot(subrules2, method = "paracoord")

#The width of the arrows represents support and the intensity of the color represent confidence. It is obvious that for larger rule sets visual analysis becomes difficult since with an increasing number of rules also the number
#of crossovers between the lines increases

#reduce crossover by reorder
plot(subrules2, method = "paracoord", control = list(reorder = TRUE))
