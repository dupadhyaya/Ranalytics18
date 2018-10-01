# Association Rule - Simple Example Case
# read this pdf for help
#https://cran.r-project.org/web/packages/arules/arules.pdf

#libraries
library(arules)
library(arulesViz)

#Create Data

#Method3 Use: ----
#Data in the form of list
itemlist = list(c('I1','I2','I5'), c('I2','I4'), c('I2','I3'),c('I1','I2','I4'),c('I1','I3'),c('I2','I3'),c('I1','I3'),c('I1','I2','I3','I5'),c('I1','I2','I3'))
itemlist
length(itemlist)
## set transaction names
names(itemlist) <- paste("Tr",c(1:9), sep = "")
itemlist
## coerce into transactions
tdata3 <- as(itemlist, "transactions")
tdata3
summary(tdata3)

tdata=tdata3

#Data ready - Perform AR ----
## analyze transactions
summary(tdata)
itemlist
image(tdata)

#Analysis
freqitems = eclat(tdata) #default support=.1
freqitems = eclat(tdata, parameter = list(minlen=1, supp=.1, maxlen=2 ))

freqitems
inspect(freqitems)

support(items(freqitems[1:2]), transactions=tdata)
inspect(freqitems[1])
inspect(items(freqitems[1]))

itemFrequencyPlot(tdata,topN = 5,type="absolute")
itemFrequencyPlot(tdata,topN = 5,type="relative", horiz=T)
write.csv(as.data.frame(inspect(freqitems)),'freqitems1.csv')


#Construct the Rules
rules = apriori(tdata, parameter = list(supp = 0.2, conf = 0.5, minlen=2))
itemFrequencyPlot(items(rules))

inspect(rules[1:5])
inspect(rules)
write.csv(as.data.frame(inspect(rules)),'rules1.csv')
#sort rules by support
rules_s = sort(rules, by="support", decreasing=TRUE )
inspect(rules_s)
inspect(rules_s[1:5])  #itemsset having high support

#sort rules by confidence
rules_c = sort(rules, by="confidence", decreasing=TRUE )
inspect(rules_c)
inspect(rules_c[1:5])  #itemsset having high confidence

#sort rules by lift
inspect(head(rules, n = 3, by ="lift"))
rules_l = sort(rules, by="lift", decreasing=TRUE )
inspect(rules_l)
inspect(rules_l[1:5])  #itemsset having high confidence

#Quality Data of Rules
quality(rules_c) 

#Redundant Rules
inspect(rules)
(redundant = which(is.redundant(rules)))
inspect(rules[c(8,9,10,11,12,14,14)])

inspect(rules[redundant])
inspect(rules)
write.csv(as(rules,"data.frame"), file='./data/rulesR.csv')

#Remove Redundant Rules
rulesNR <- rules[-redundant] 
is.redundant(rulesNR)
sum(is.redundant(rulesNR))  #ok now
inspect(rulesNR)

#Rules with LHS and RHS: single or combination
rules2= rulesNR
inspect(rules2)
rules2.lhs1 <- subset(rules2, lhs %in% c("I1", "I5"))
inspect(rules2.lhs1)

rules2.rhs1 <- subset(rules2, rhs %in% c("I3"))
inspect(rules2.rhs1)

rules2.lhsrhs1 = subset(rules2, lhs %in% c("I1") & rhs %in% c("I3"))
inspect(rules2.lhsrhs1)

rules2.lhsrhs2 = subset(rules2, lhs %in% c("I1") | rhs %in% c("I3"))
inspect(rules2.lhsrhs2)



# Rules as DF: original rules
rules_DF <- as(rules,"data.frame")
rules_DF
str(rules_DF)
write.csv(rules_DF, './data/myrules1.csv')

#Visualisation
plot(rules)
