# Subject Choices of Electives
#http://tallman-world.tumblr.com/post/111511141517/rhow-to-make-association-rules-on-r-all-integer
library(arules)
datar2 <- read.csv("dar3b.csv", header = TRUE, row.names=1)
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


#apriori() is a function to make association rules.
#maxlen means a number of rules (in this case, number of effects of an datar2) in a association rule.
#support means how often it happens (or probability of an event). 0.04 is not so rare, not too often.
#And confidence means how often it occurs under specific situations. If this is so small, it may be not be worth making association rules in the first place.
#Now, check summary of the association rules  made, with summary().
#check a number of rules and how many rules each association rule has.
#datar2.rule = sort(datar2.rule, by='confidence', decreasing=T)
datar2.rule = sort(datar2.rule, by='lift', decreasing=T)

summary(datar2.rule)
inspect(sort(subset(datar2.rule, subset= (support >0.5))))

#In order to inspect the contents of association rules, I can do it as below;
inspect(datar2.rule[1:5])

#If I want to extract specific association rules, I use subset() as below.
#In this case, I want the result to have “comnskills” as the rule body and more than 1 lift.

rule1 <- subset(datar2.rule, subset=(rhs %in% "elective6") & (lift>1.0))
rule1
inspect(rule1)


rule2 <- subset(datar2.rule, subset=(rhs %in% c('elective3','elective4')) & (lift>1.5))
rule2 = sort(rule2, by='confidence', decreasing=T)
inspect(rule2)

rule3 <- subset(datar2.rule, subset=(rhs %in% "elective1") & (support >0.5))
rule3 = sort(rule3, by='support', decreasing=T)
inspect(rule3)
