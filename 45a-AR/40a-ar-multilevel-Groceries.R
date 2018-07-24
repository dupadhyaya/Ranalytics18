#Multi Level AR 
#https://rdrr.io/cran/arules/man/aggregate.html

data(Groceries)

head(itemInfo(Groceries))
## aggregate by level2: items will become labels at level2
## Note that the number of items is therefore reduced to 55
Groceries_level2 <- aggregate(Groceries, by = "level2")
Groceries_level2
head(itemInfo(Groceries_level2)) ## labels are alphabetically sorted!


## compare orginal and aggregated transactions
inspect(head(Groceries, 2))
inspect(head(Groceries_level2, 2))

itemLabels(Groceries)
## create lables manually (organize items by the first letter)
mylevels <- toupper(substr(itemLabels(Groceries), 1, 1))
head(mylevels)

Groceries_alpha <- aggregate(Groceries, by = mylevels)
Groceries_alpha
inspect(head(Groceries_alpha, 2))

## aggregate rules ## Note: you could also directly mine rules from aggregated transactions toget support, lift and support
rules <- apriori(Groceries, parameter=list(supp=0.005, conf=0.5))
rules
inspect(rules[1])

rules_level2 <- aggregate(rules, by = "level2")
inspect(rules_level2[1])

## mine multi-level rules:
## (1) add aggregate items. These items are followed by a *
Groceries_multilevel <- addAggregate(Groceries, "level2")
summary(Groceries_multilevel)
inspect(head(Groceries_multilevel))

rules <- apriori(Groceries_multilevel, 
                 parameter = list(support = 0.01, conf = .9))
inspect(head(rules, by = "lift"))
## this contains many spurous rules of type 'item X => aggregare of item X'
## with a confidence of 1 and high lift.

## filter spurious rules resulting from the aggregation 
rules <- filterAggregate(rules)
inspect(head(rules, by = "lift"))

