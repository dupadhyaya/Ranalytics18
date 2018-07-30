# Documentation on arules

library(arules)





#----



#----


#significant
#LHS andthe RHS depend on each other. 
data("Income")
rules <- apriori(Income, parameter = list(support = 0.5))
is.significant(rules, Income)
inspect(rules[is.significant(rules, Income)])

#super-subset-----
#memory intensive- looks for each element in x which elements in y are supersets or subsets.
data("Adult")
set <- eclat(Adult, parameter = list(supp = 0.8))
inspect(set)
### find the supersets of each itemset in set
is.superset(set, set)
is.superset(set, set, sparse = FALSE)
is.subset(set,set)


#itemCoding----
data("Adult")
## Example 1: Manual decoding
## get code
iLabels <- itemLabels(Adult)
head(iLabels)
## get undecoded list and decode in a second step
list <- LIST(Adult[1:5], decode = FALSE)
list

decode(list, itemLabels = iLabels)
## Example 2: Manually create an itemMatrix
data <- list(
  c("income=small", "age=Young"),
  c("income=large", "age=Middle-aged")
)
iM <- encode(data, iLabels)
iM
inspect(iM)
## use the itemMatrix to create transactions
as(iM, "transactions")
## Example 3: use recode
## select first 100 transactions and all education-related items
sub <- Adult[1:100, itemInfo(Adult)$variables == "education"]
itemLabels(sub)
image(sub)
## recode to match Adult again
sub.recoded <- recode(sub, match = Adult)
image(sub.recoded)

#itemFrequency
data("Adult")
itemFrequency(Adult, type = "relative")


#itemFrequencyPlot
data(Adult)
## the following example compares the item frequencies
## of people with a large income (boxes) with the average in the data set
Adult.largeIncome <- Adult[Adult %in%  "income=large"]
## simple plot
itemFrequencyPlot(Adult.largeIncome)
## plot with the averages of the population plotted as a line
## (for first 72 variables/items)
itemFrequencyPlot(Adult.largeIncome[, 1:72],population = Adult[, 1:72])
## plot lift ratio (frequency in x / frequency in population)
## for items with a support of 20% in the population
itemFrequencyPlot(Adult.largeIncome, population = Adult, support = 0.2,
                  lift = TRUE, horiz = TRUE)





#itemsetsclass-----
data("Adult")
## Mine frequent itemsets with Eclat.
fsets <- eclat(Adult, parameter = list(supp = 0.5))
## Display the 5 itemsets with the highest support.
fsets.top5 <- sort(fsets)[1:5]
inspect(fsets.top5)
## Get the itemsets as a list
as(items(fsets.top5), "list")
## Get the itemsets as a binary matrix
as(items(fsets.top5), "matrix")
## Get the itemsets as a sparse matrix, a ngCMatrix from package Matrix.
## Warning: for efficiency reasons, the ngCMatrix you get is transposed
as(items(fsets.top5), "ngCMatrix")


#LIST----
data(Adult)
### default coercions (same as as(Adult[1:5], "list"))
LIST(Adult[1:5])
### coercion without item decoding: uses column n
LIST(Adult[1:5], decode = FALSE)


#match----
data("Adult")
## get unique transactions, count frequency of unique transactions
## and plot frequency of unique transactions
vals <- unique(Adult)
vals
cnts <- tabulate(match(Adult, vals))
cnts
plot(sort(cnts, decreasing=TRUE))
## find all transactions which are equal to transaction 10 in Adult
which(Adult %in% Adult[10])
## for transactions we can also match directly with itemLabels.
## Find in the first 10 transactions the ones which
## contain age=Middle-aged (see help page for class itemMatrix)
Adult[1:10] %in% "age=Middle-aged"
inspect(Adult[1:3])
## find all transactions which contain items that partially match "age=" (all here).
Adult[1:10] %pin% "age="
## find all transactions that only include the item "age=Middle-aged" (none here).
Adult[1:10] %oin% "age=Middle-aged"
## find al transaction which contain both items "age=Middle-aged" and "sex=Male"
Adult[1:10] %ain% c("age=Middle-aged", "sex=Male")



#merge----
data("Groceries")
## create a random item as a matrix
randomItem <- sample(c(TRUE, FALSE), size=length(Groceries),replace=TRUE)
randomItem
randomItem <- as.matrix(randomItem)
randomItem
colnames(randomItem) <- "random item"
head(randomItem, 3)
## add the random item to Groceries
g2 <- merge(Groceries, randomItem)
nitems(Groceries)
nitems(g2)
inspect(head(g2,3))  #added to 3rd transaction

#Mushroom----
data("Mushroom")
inspect(head(Mushroom,3))
head(LIST(Mushroom),3)

#predit----
data("Adult")
## sample
small <- sample(Adult, 500)
head(LIST(small))
large <- sample(Adult, 5000)
head(LIST(large))

## cluster a small sample
d_jaccard <- dissimilarity(small)
head(d_jaccard)
hc <- hclust(d_jaccard)
hc
l <- cutree(hc, k=4)

## predict labels for a larger sample
labels <- predict(small, large, l)
## plot the profile of the 1. cluster
itemFrequencyPlot(large[labels==1, itemFrequency(large) > 0.2])


#random.transactions----


#read.PMML-----
library(pmml)
data("Groceries")
rules <- apriori(Groceries, parameter=list(support=0.001))
rules <- head(rules, by="lift")
rules
inspect(rules)
### save rules as PMML
write.PMML(rules, file = "rules.xml")
### read rules back
rules2 <- read.PMML("rules.xml")
rules2
### compare rules
inspect(rules[1])
inspect(rules2[1])
### clean up
unlink("rules.xml")


#read.transactions----
## create a demo file using basket format for the example
data <- paste(
  "# this is some test data",
  "item1, item2",
  "item1",
  "item2, item3",
  sep="\n")
cat(data)
write(data, file = "demo_basket")
## read demo data (skip comment line)
tr <- read.transactions("demo_basket", format = "basket", sep=",", skip = 1)
inspect(tr)
## create a demo file using single format for the example
## column 1 contains the transaction ID and column 2 contains one item
data <- paste(
  "trans1 item1",
  "trans2 item1",
  "trans2 item2",
  sep ="\n")
cat(data)
write(data, file = "demo_single")
## read demo data
tr <- read.transactions("demo_single", format = "single", cols = c(1,2))
inspect(tr)
## tidy up
unlink("demo_basket")
unlink("demo_single")

# rule-induction-----
data("Adult")
## find all closed frequent itemsets
closed_is <- apriori(Adult,  parameter = list(target = "closed frequent itemsets", support = 0.4))
closed_is
## use rule induction to produce all closed association rules
closed_rules <- ruleInduction(closed_is, Adult,control = list(verbose = TRUE))
## X&Y are already closed, check that X is also closed
closed_rules[is.element(lhs(closed_rules), items(closed_is))]
## inspect the resulting closed rules
summary(closed_rules)
inspect(head(closed_rules, by = "lift"))

## use lattice of frequent itemsets
ec <- eclat(Adult, parameter = list(support = 0.4))
rec <- ruleInduction(ec)
rec
inspect(head(rec))


#rule-class----
data("Adult")
## Mine rules.
rules <- apriori(Adult, parameter = list(support = 0.4))
## Select a subset of rules using partial matching on the items
## in the right-hand-side and a quality measure
rules.sub <- subset(rules, subset = rhs %pin% "sex" & lift > 1.3)
## Display the top 3 support rules
inspect(head(rules.sub, n = 3, by = "support"))
## Display the first 3 rules
inspect(rules.sub[1:3])
## Get labels for the first 3 rules
labels(rules.sub[1:3])
labels(rules.sub[1:3], itemSep = " + ", setStart = "", setEnd="",
       ruleSep = " ---> ")

#sample----
data("Adult")
## sample with replacement
s <- sample(Adult, 50, replace = TRUE)
s


#setOperations----
data("Adult")
## mine some rules
r <- apriori(Adult)
## take 2 subsets
r1 <- r[1:10]
r2 <- r[6:15]
union(r1,r2)
intersect(r1,r2)
setequal(r1,r2)


#size----
data("Adult")
summary(size(Adult))


#sort----
data("Adult")
## Mine rules with APRIORI
rules <- apriori(Adult, parameter = list(supp = 0.6))
rules_by_lift <- sort(rules, by = "lift")
inspect(head(rules))
inspect(head(rules_by_lift))
## A faster/less memory consuming way to get the top 5 rules according to lift
inspect(head(rules, n = 5, by = "lift"))


#subset-----
#subset works on the rows/itemsets/rules of x
#%in% (selectitemsets matching any given item), %ain% (select only itemsets matching all given item), %oin% (select only itemsets matching only the given item), and %pin% (%in% with partial matching)

data("Adult")
rules <- apriori(Adult)
## select all rules with item "marital-status=Never-married" in
## the right-hand-side and lift > 2
rules.sub <- subset(rules, subset = rhs %in% "marital-status=Never-married" & lift > 2)
## use partial matching for all items corresponding to the variable
## "marital-status"
rules.sub <- subset(rules, subset = rhs %pin% "marital-status=")
## select only rules with items "age=Young" and "workclass=Private" in the left-hand-side
rules.sub <- subset(rules, subset = lhs %ain% c("age=Young", "workclass=Private"))

#SunBai----
data(SunBai)
summary(SunBai)
inspect(SunBai)
transactionInfo(SunBai)


#support----
data("Income")
## find and some frequent itemsets
itemsets <- eclat(Income)[1:5]
## inspect the support returned by eclat
inspect(itemsets)
## count support in the database
support(items(itemsets), Income)


#supportingTransactions----
data <- list(
  c("a","b","c"),
  c("a","b"),
  c("a","b","d"),
  c("b","e"),
  c("b","c","e"),
  c("a","d","e"),
  c("a","c"),
  c("a","b","d"),
  c("c","e"),
  c("a","b","d","e")
)
data <- as(data, "transactions")
## mine itemsets
f <- eclat(data, parameter = list(support = .2, minlen=3))
inspect(f)
## find supporting Transactions
st <- supportingTransactions(f, data)
st
as(st, "list")

#tidLists-class----
## Create transaction data set.
data <- list(
  c("a","b","c"),
  c("a","b"),
  c("a","b","d"),
  c("b","e"),
  c("b","c","e"),
  c("a","d","e"),
  c("a","c"),
  c("a","b","d"),
  c("c","e"),
  c("a","b","d","e")
)
data <- as(data, "transactions")
data
## convert transactions to transaction ID lists
tl <- as(data, "tidLists")
tl
inspect(tl)
dim(tl)
dimnames(tl)
## inspect visually
image(tl)


#transactions-class-----
## example 1: creating transactions form a list
a_list <- list(
  c("a","b","c"),
  c("a","b"),
  c("a","b","d"),
  c("c","e"),
  c("a","b","d","e")
)
## set transaction names
names(a_list) <- paste("Tr",c(1:5), sep = "")
a_list
## coerce into transactions
trans1 <- as(a_list, "transactions")
## analyze transactions
summary(trans1)
image(trans1)
## example 2: creating transactions from a matrix
a_matrix <- matrix(c(
  1,1,1,0,0,
  1,1,0,0,0,
  1,1,0,1,0,
  0,0,1,0,1,
  1,1,0,1,1
), ncol = 5)

## set dim names
dimnames(a_matrix) <- list(c("a","b","c","d","e"),
                           paste("Tr",c(1:5), sep = ""))
a_matrix
## coerce
trans2 <- as(a_matrix, "transactions")
trans2
inspect(trans2)
## example 3: creating transactions from data.frame
a_df <- data.frame(
  age = as.factor(c(6, 8, NA, 9, 16)),
  grade = as.factor(c("A", "C", "F", NA, "C")),
  pass = c(TRUE, TRUE, FALSE, TRUE, TRUE))
## note: factors are translated differently to logicals and NAs are ignored
a_df
## coerce
trans3 <- as(a_df, "transactions")
inspect(trans3)
as(trans3, "data.frame")

## example 4: creating transactions from a data.frame with
## transaction IDs and items (by converting it into a list of transactions first)
a_df3 <- data.frame(
  TID = c(1,1,2,2,2,3), item=c("a","b","a","b","c", "b")
)
a_df3
trans4 <- as(split(a_df3[,"item"], a_df3[,"TID"]), "transactions")
trans4
inspect(trans4)
## Note: This is very slow for large datasets. It is much faster to
## read transactions in this format from disk using read.transactions()## with format = "single".
## example 5: create transactions from a dataset with numeric variables## using discretization.
data(iris)
irisDisc <- discretizeDF(iris)
head(irisDisc)
trans5 <- as(irisDisc, "transactions")
trans5
inspect(head(trans5))


#unique----
data("Adult")
r1 <- apriori(Adult[1:1000], parameter = list(support = 0.5))
r2 <- apriori(Adult[1001:2000], parameter = list(support = 0.5))
## Note that this produces a collection of rules from two sets
r_comb <- c(r1, r2)
r_comb <- unique(r_comb)
r_comb


#weclat-----
data(SunBai)
SunBai
## weights are stored in transactionInfo
transactionInfo(SunBai)
## mine weighted support itemsets using transaction support in SunBai
s <- weclat(SunBai, parameter = list(support = 0.3),
            control = list(verbose = TRUE))
inspect(sort(s))
## create rules using weighted support (satisfying a minimum
## weighted confidence of 90%).
r <- ruleInduction(s, confidence = .9)
inspect(r)

#write----
data("Epub")
head(Epub)
## write the formated transactions to screen (basket format)
write(head(Epub))
## write the formated transactions to screen (single format)
write(head(Epub), format="single")

## write the formated result to file in CSV format
write(Epub, file = "data.csv", format="single", sep = ",")
## write rules in CSV format
rules <- apriori(Epub, parameter=list(support=0.0005, conf=0.8))
write(rules, file = "data.csv", sep = ",")
unlink("data.csv") # tidy up  delete files

#[----
data(Adult)
Adult
## select first 10 transactions
Adult[1:10]
## select first 10 items for first 100 transactions
Adult[1:100, 1:10]
## select the first 100 transactions for the items containing
## "income" or "age=Young" in their labels
Adult[1:100, c("income=small", "income=large" ,"age=Young")]
