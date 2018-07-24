# AR - Visualisation

library(arules)
library(datasets)
data(Groceries)
library(arulesViz)
rules <- apriori(Groceries, parameter = list(support=.001, confidence=.7,
                                             maxlen=5, target='rules' ))


plot(rules, measure = c("support", "lift"), shading = "confidence")
plot(rules, measure = c("confidence", "lift"), shading = "support")


#Twokey plot. Here support and confidence are used for the x and y-axes and the color of the points is used to indicate “order,” i.e., the number of items contained in the rule. Two-key plots can be produced using the unified interface by:
plot(rules, method = "two-key plot")

#order and support have a very strong inverse relationship, which is a known fact for association rules



#Interactive
sel <- plot(rules, measure=c("support", "lift"), shading = "confidence", interactive = TRUE)
#Inspecting individual rules by selecting them and clicking the inspect button.
#Inspecting sets of rules by selecting a rectangular region of the plot and clicking the inspect button.
#Zooming into a selected region (zoom in/zoom out buttons).
#Filtering rules using the measure used for shading by clicking the filter button and selecting a cut-off point in the color key. All rules with a measure lower than the cut-off point will be filtered.
#Returning the last selection for further analysis (end button).


