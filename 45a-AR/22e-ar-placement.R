# Data set - Placement Selection Criteria
#http://tallman-world.tumblr.com/post/111511141517/rhow-to-make-association-rules-on-r-all-integer
# About data set
library(arules)
datar2 <- read.csv("./data/dar2.csv", header = TRUE, row.names=1)
str(datar2)
datar2 <- as.matrix(datar2)
str(datar2)
head(datar2)
#If all the columns except the row name are two-valued data (0 or 1), matrix class is easier to deal with in association rules.
#IMP If all the columns are string data, I just convert the data.frame into transaction data without converting it into matrix data.
#Next, I convert onsen matrix into transaction class.
datar2.trans <- as(datar2, "transactions")
str(datar2.trans)
summary(datar2.trans) # check what’s in the transaction data.
#With inspect(), check each transaction’s items.
inspect(datar2.trans)

#want to know frequency of items, I can plot as below;
itemFrequencyPlot(datar2.trans, ylim=c(0,1))
#Making association rules ####
#Now make association rules.
options(digits=2)
datar2.rule <- apriori(datar2.trans, parameter = list(maxlen=3, support=0.04, confidence=0.8, ext=TRUE))

datar2.rule = sort(datar2.rule, by='confidence', decreasing=T)

summary(datar2.rule)

#inspect
inspect(datar2.rule[1:5])

#extract specific association rules, use subset
#subset - commnskills  and lift > 1

rule1 <- subset(datar2.rule, subset=(rhs %in% "comnskills") & (lift>1.0))
rule1
inspect(rule1[1:5])

rule2 <- subset(datar2.rule, subset=(rhs %in% c('extraco','gender'))  & (lift>1.7))
rule2
inspect(rule2[1:5])

rule3 <- subset(datar2.rule, subset=(rhs %in% "select") & lhs %in% "relocwilling" & (lift>1.0))
rule3
inspect(rule3)
