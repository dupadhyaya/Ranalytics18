
library(arules)
library(arulesViz)
data(Groceries)
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.8))
inspect(rules[1:5])
## Scatterplot
## -----------
plot(rules)

## Scatterplot with custom colors
library(colorspace) # for sequential_hcl
plot(rules, control = list(col=sequential_hcl(100)))
plot(rules, col=sequential_hcl(100))
plot(rules, col=grey.colors(50, alpha =.8))


## See all control options using verbose
plot(rules, verbose = TRUE)

plot(rules, engine = "htmlwidget")
plot(rules, method = "two-key plot")


subrules <- subset(rules, lift>5)
subrules
## 2D matrix with shading
plot(subrules, method="matrix")
## 3D matrix
plot(subrules, method="matrix", engine = "3d")
## Matrix with two measures
plot(subrules, method="matrix", shading=c("lift", "confidence"))


plot(rules, method="grouped matrix")
plot(rules, method="grouped matrix", col = grey.colors(10),   gp_labels = gpar(col = "blue", cex=1, fontface="italic"))


## Graphs only work well with very few rules
subrules2 <- sample(subrules, 25)

plot(subrules2, method="graph")
## Custom colors
plot(subrules2, method="graph",  nodeCol = grey.colors(10), edgeCol = grey(.7), alpha = 1)
## igraph layout generators can be used (see ? igraph::layout_)
plot(subrules2, method="graph", layout=igraph::in_circle())
plot(subrules2, method="graph",
     layout=igraph::with_graphopt(spring.const=5, mass=50))

## Parallel coordinates plot
## -------------------------
plot(subrules2, method="paracoord")
plot(subrules2, method="paracoord", reorder=TRUE)

## Note: only works for a single rule
oneRule <- sample(rules, 1)
inspect(oneRule)
plot(oneRule, method="doubledecker", data = Groceries)


## Itemsets
## --------
itemsets <- eclat(Groceries, parameter = list(support = 0.02, minlen=2))
plot(itemsets)
plot(itemsets, method="graph")
plot(itemsets, method="paracoord", alpha=.5, reorder=TRUE)


## Add more quality measures to use for the scatterplot
## ----------------------------------------------------
quality(itemsets) <- interestMeasure(itemsets, trans=Groceries)
head(quality(itemsets))
plot(itemsets, measure=c("support", "allConfidence"), shading="lift")



library(plotly)
data(Groceries)
rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.8))
rules
# interactive scatter plot visualization
plotly_arules(rules)
plotly_arules(rules, measure = c("support", "lift"), shading = "confidence")
plotly_arules(rules, method = "two-key plot")

# add jitter, change color and markers and add a title
plotly_arules(rules, jitter = 10,
              marker = list(opacity = .7, size = 10, symbol = 1),
              colors = c("blue", "green"))
# save a plot as a html page
p <- plotly_arules(rules)
htmlwidgets::saveWidget(p, "arules.html", selfcontained = FALSE)
browseURL("arules.html")
# Note: selfcontained seems to make the browser slow.
# interactive matrix visualization
plotly_arules(rules, method = "matrix")

#Graph
#
data("Groceries")
rules <- apriori(Groceries, parameter=list(support=0.01, confidence=0.5))
saveAsGraph(rules, "rules.graphml")
## clean up
unlink("rules.graphml")