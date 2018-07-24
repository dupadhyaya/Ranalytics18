#AR - Graph Based Visualisation

library(arules)
library(datasets)
library(arulesViz)

data(Groceries)

rules <- apriori(Groceries, parameter = list(support=.001, confidence=.7,
                       maxlen=5, target='rules' ))

#visualize association rules using vertices and edges where vertices annodated with item labels represent items, and itemsets or rules are reptesented as a second set of vertices. Items are connected with itemsets/rules using arrows. For rules arrows pointing from items to rule vertices indicate LHS items and an arrow from a rule to an item indicates the RHS. Interest measures are typically added to the plot by using color or size of the vertices representing the itemsets/rules.

#Graph-based visualization offers a very clear representation of rules but they tend to easily become cluttered and thus are only viable for very small sets of rule

subrules2 <- head(rules, n = 10, by = "lift")

plot(subrules2, method = "graph")


#only useful for small set of rules. To explore large sets of rules with graphs, advanced interactive features like zooming, filtering, grouping and coloring nodes are needed

saveAsGraph(head(rules, n = 1000, by = "lift"), file = "rules.graphml")
