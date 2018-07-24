#AR - sample Case
library(arules)

#Data
#Method1: format basket
itemlist1 = paste('I1,I2,I5','I2,I4', 'I2,I3','I1,I2,I4','I1,I3','I2,I3','I1,I3','I1,I2,I3,I5','I1,I2,I3', sep="\n");
itemlist1
write(itemlist1, file = "./data/itemlist1");
tdata1 = read.transactions("./data/itemlist1", format = "basket", sep=",");
summary(tdata1)
inspect(tdata1);

#Modeling
library(arules)
tdata1
inspect(abbreviate(tdata1))  #smaller names of items

fitems = eclat(tdata1, parameter = list(supp = 0.0))
inspect(fitems)
inspect(sort(fitems, by='support'))
rules = apriori(tdata1, list(supp = 0.10, conf=.60, minlen=2) )

inspect(rules )
inspect(head(rules, n = 5, by ="lift"))
inspect(head(rules, n = 5, by ="support"))

rules2 = apriori(tdata1, list(supp = 0.2, conf=.8) )
inspect(rules2)
support(items(fitems), tdata1)


#Part 2
rules3 <- ruleInduction(fitems, tdata1, confidence = 0)
inspect(rules3)

#Other Measures
#https://rdrr.io/cran/arules/man/interestMeasure.html
measures = c('lift', 'confidence', 'support', 'conviction', 'count', 'coverage', 'doc', 'importance')
interestMeasure(rules,measure=measures, tdata1)

inspect(fitems[is.maximal(fitems)])

length(fitems)
LIST(fitems)
size(fitems)
inspect(fitems)
supportingTransactions(fitems, tdata1)
unique(fitems)
support(fitems, tdata1)
subset(rules,  lhs %in% c("I3",'I1') & lift > 1)
subset(rules,  lhs %oin% c("I1",'I2') & lift > 1)

#Cross Table - Good
crossTable(tdata1, measure = c("count"), sort = FALSE)
crossTable(tdata1, measure = c("lift"), sort = FALSE)
crossTable(tdata1, measure = c("support"), sort = FALSE)
DATAFRAME(fitems)
DATAFRAME(rules)
DATAFRAME(rules, separate = TRUE, setStart = '', itemSep = ' + ', setEnd = '')

hits(tdata1, iter = 16L, tol = NULL, type = "absolute")
itemFrequency(tdata1)
is.closed(fitems)
inspect(fitems[is.closed(fitems)])
inspect(fitems[is.significant(rules,tdata1, method='fisher')])

coverage(rules, transactions = tdata1)
cbind(quality(rules), coverage = coverage(rules))

#aggregate(rules, by='level2')

#Combine trans, rules
aComb <- c(a1, a2)
rComb <- c(r1, r2) 
rUnion <- union(r1,r2)

#Add items
g2 <- addComplement(tdata1, c("I1","I2","I3","I4"))
inspect(g2)

## use a custom label for the complement-item
g2=addComplement(tdata1, labels="I5", complementLabels=c('No-I5'))
inspect(g2)


#
## Example 1: Manual decoding
## get code
iLabels <- itemLabels(tdata1)
head(iLabels)

## get undecoded list and decode in a second step
list <- LIST(tdata1, decode = FALSE)
list

decode(list, itemLabels = iLabels)
inspect(tdata1)



#Random Items
## create a random item as a matrix
randomItem <- sample(c(TRUE, FALSE), size=length(tdata1),replace=TRUE)
randomItem <- as.matrix(randomItem)
colnames(randomItem) <- "random item"
head(randomItem, 3)

## add the random item to Groceries
g3 <- merge(tdata1, randomItem)
nitems(tdata1)
nitems(g3)
inspect(head(g3))


#----
#https://rdrr.io/cran/arules/f/inst/doc/arules.pdf
random.transactions(c('I1','I2','I3', 'I4','I5'))
items5 = random.transactions(15,10, method='agrawal')
inspect(items5)
trans <- random.transactions(nItems = 20, nTrans = 1000,  lambda = 5, iProb = seq(0.2,0.0001, length=20))
summary(size(trans))
summary(trans)


fi = eclat(trans)
LIST(fi)

image(trans)
itemMatrix(trans)
class(trans)
inspect(trans[1:5])

itemFrequencyPlot(trans,topN = 5,type="absolute")
itemFrequencyPlot(trans,topN = 5,type="relative", horiz=T)

#Construct the Rules
rules8 = apriori(trans, parameter = list(supp = 0.02, conf = 0.7, minlen=2))
itemFrequencyPlot(items(rules8))

inspect(rules8)



#
AR in R : simple steps
#eclat
library(arules)
library(arulesViz)
library(igraph)
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_144')
library(iplots)
data <- read.transactions('file', sep=',')
tdata1
itemsets <- eclat(tdata, parameter = list(supp = 0.1, minlen=2, maxlen = 3))
inspect(itemsets)
plot(itemsets, method="graph", control=list(type="items"))
