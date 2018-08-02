# Transactions from Liberty Store
# Create AR for the data with 33% support level & 66% conf

barley = c(1,NA, 1, NA, 1, NA, 1, NA, 1, 1, NA, 1)
corn = c(1, 1, NA, 1, NA, NA, NA, NA, 1, 1, 1, 1)
gram = c(1, NA, 1,1,1,1,NA, NA, 1,1, NA, NA)
millet = c(1,1,NA, NA, 1, NA, 1,1,1,NA,1,1)
rice = c(1,1,1,1,1,1,1,1,NA,1,1,1)
wheat = c(1,1,1,1,NA,1,1,1,NA,1,1,1)
sapply(list(barley, corn, gram, millet, rice, wheat), length)

stores = data.frame(barley,corn,millet, rice, wheat)
apply(stores, 2, length)
apply(stores, 2, is.na)
colSums(!is.na(stores))

(stores1= as.data.frame(apply(stores, 2, as.factor)))

library(arules)
stores2= as(stores1, 'transactions')
inspect(stores2)

fitems1 = arules::eclat(stores2, parameter = list(support=0.33, minlen=2, maxlen=4))
inspect(fitems1)
rules1 = ruleInduction(fitems1, stores2, confidence=.7)
rules1
inspect(rules1)


# Part 2

rules2 = apriori(stores2, parameter =list(supp=0.33, conf=.7, minlen=2, maxlen=6))
inspect(rules2)


#Sort
(top.support <- sort(rules2, decreasing = TRUE, na.last = NA, by = "support"))
inspect(head(top.support,10))

top.confidence <- sort(rules2, decreasing = TRUE, na.last = NA, by = "confidence")
inspect(head(top.confidence,10))

# lhs, rhs
rules3 <- apriori(stores2, parameter=list(supp = 0.1, conf = 0.8),  appearance = list(lhs = c("wheat=1", "millet=1"),default = "rhs"))
top.lift3 = sort(rules3, decreasing = TRUE, na.last = NA, by = "lift")
inspect(top.lift3)
inspect(head(subset(top.lift3, lhs %pin% "wheat"), 3))

rules4 <- apriori(stores2, parameter=list(supp = 0.001, conf = 0.3),  appearance = list(lhs = c("wheat=1") , rhs= c('rice=1')))
top.lift4 = sort(rules4, decreasing = TRUE, na.last = NA, by = "lift")
inspect(top.lift4)
inspect(head(subset(top.lift4, lhs %pin% "wheat"), 3))




as(rules2, "data.frame")
