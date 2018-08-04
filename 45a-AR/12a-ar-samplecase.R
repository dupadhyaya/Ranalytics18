# Association Rule - Simple Example Case

#libraries
library(arules)
library(arulesViz)

#Create Data
#Method1: format basket
itemlist1 = paste('I1,I2,I5','I2,I4', 'I2,I3','I1,I2,I4','I1,I3','I2,I3','I1,I3','I1,I2,I3,I5','I1,I2,I3', sep="\n");
itemlist1
write(itemlist1, file = "./data/itemlist1");
tdata1 = read.transactions("./data/itemlist1", format = "basket", sep=",");
summary(tdata1)
tdata1
inspect(tdata1)

#Method2
itemlist2 <- data.frame(
  TID = c(1,1,1,2,2,3,3,4,4,4,5,5,6,6,7,7,8,8,8,8,9,9,9), 
  item=c('I1','I2','I5', 'I2','I4', 'I2','I3','I1','I2','I4','I1','I3','I2','I3','I1','I3','I1','I2','I3','I5','I1','I2','I3')
)
itemlist2
tdata2 <- as(split(itemlist2[,"item"], itemlist2[,"TID"]), "transactions")
tdata2
inspect(tdata2)
summary(tdata2)
image(tdata2)

#Method3 Use: ----
#Data in the form of list
itemlist = list(c('I1','I2','I5'), c('I2','I4'), c('I2','I3'),c('I1','I2','I4'),c('I1','I3'),c('I2','I3'),c('I1','I3'),c('I1','I2','I3','I5'),c('I1','I2','I3'))
length(itemlist)
## set transaction names
names(itemlist) <- paste("Tr",c(1:9), sep = "")
itemlist
## coerce into transactions
tdata3 <- as(itemlist, "transactions")
tdata3
summary(tdata3)
inspect(tdata3)

#Method4 : DF ----
T1 = c(T,T,F,F,T); T2 = c(T,F,F,T,F); T3 = c(F,T,T,F,T)
T4 = c(T,T,F,T,F); T5 = c(T,F,T,F,T); T6 = c(F,T,T,F,T)
T7 = c(T,F,T,F,T); T8 = c(T,T,T,F,T); T9 = c(T,T,T,F,T)
df = data.frame(rbind(T1,T2,T3,T4,T5,T6,T7,T8,T9))
colnames(df)=c('I1','I2','I3','I4','I5')
df
tdata4 = as(df, "transactions")
summary(tdata4)
tdata4
inspect(tdata4)

tdata=tdata1

#Data ready - Perform AR ----
## analyze transactions
summary(tdata)
image(tdata)

#Analysis
freqitems = eclat(tdata)
freqitems
inspect(freqitems)
itemFrequencyPlot(tdata,topN = 5,type="absolute")
itemFrequencyPlot(tdata,topN = 5,type="relative", horiz=T)

#Construct the Rules
rules = apriori(tdata, parameter = list(supp = 0.1, conf = 0.6, minlen=2))
itemFrequencyPlot(items(rules))

inspect(rules)

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

#This interactve plot will open in another window
#use menu options to check 
plot(rules[1:5],method="graph",engine='interactive', shading="confidence") 

#plot with unified interface, the no of items contained in the rule
plot(rules, method = "two-key plot")

#plot with lift on the y-axis. identify all rules with high lift. 
plot(rules, measure = c("support", "lift"), shading = "confidence")

#Matrix Plots
subrules <- rules[quality(rules)$confidence > 0.8]
inspect(subrules)
plot(subrules, method = "matrix", measure = "lift")
plot(subrules, method = "matrix", engine='3d', measure = "lift")

#Grouped
plot(rules, method = "grouped")
#The group of most interesting rules according to lift (the default measure) are shown in the top-left corner of the plot.
plot(subrules, method = "graph")

plot(subrules, method = "paracoord", control = list(reorder = TRUE))

inspect(rules[14])
plot(rules[14], method = "doubledecker", data = tdata)

#https://cran.r-project.org/web/packages/arulesViz/vignettes/arulesViz.pdf


#extra
# freq items

freqitems = eclat(tdata, parameter = list(supp = 0.001))
freqitems
inspect(freqitems)

freqitems1 = eclat(tdata, parameter = list(supp = 0.1))
freqitems1
inspect(freqitems1)

freqitems2 = eclat(tdata, parameter = list(supp = 0.2))
freqitems2
inspect(freqitems2)

freqitems3 = eclat(tdata, parameter = list(supp = 0.3))
freqitems3
inspect(freqitems3)

## Create rules from the itemsets
rules3b <- ruleInduction(freqitems3, tdata, confidence = .6)
rules3b
inspect(rules3b)


#calculate confidence and lift manually
inspect(head(rules, n = 1, by ="lift"))
itemsets <- unique(generatingItemsets(rules))
itemsets
inspect(itemsets)
(itemsets.df <- as(itemsets, "data.frame"))

frequentItemsets <- itemsets.df[with(itemsets.df, order(-support,items)),]
names(frequentItemsets)[1] <- "itemset"
itemsets.df
itemFrequency(items(rules))
freqitems = eclat(tdata)
inspect(freqitems)
