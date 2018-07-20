#My Basket 3
#
set.seed(101)
transactionID = sample(1:10, 50, replace=T)
transactionID
items = sample(c('milk', 'bread', 'butter', 'eggs'),size=50, replace=T, prob=c(.4,.25,.2,.15))
items
orders <- data.frame(transactionID, items)
head(orders)

write.csv(orders, "./data/myitems1.csv")



ordertrans <- arules::read.transactions(
  file = "./data/myitems1.csv",
  format = "single",
  sep = ",",
  cols=c("transactionID","items"),
  rm.duplicates = T
)
inspect(ordertrans[1:5])
?read.transactions
summary(ordertrans)
str(ordertrans)
head(ordertrans)

# Create an item frequency plot for the top 20 items
itemFrequencyPlot(ordertrans,topN=20,type="absolute")

#minsupport to 0.001 , min conf of 0.8 ; show top 5 rules
rules <- apriori(ordertrans, parameter = list(supp = 0.001, conf = 0.8))

# Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(rules[1:5])

summary(rules)

rules<-sort(rules, by="confidence", decreasing=TRUE)
inspect(head(rules))

