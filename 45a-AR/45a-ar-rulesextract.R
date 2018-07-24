# Association Rules Extraction


library(arules)
library(arulesViz)
library(datasets)

rules = apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

# Show the top 5 rules, but only 2 digits
options(digits=5)

#summary of rule
summary(rules)

#rules with measures
inspect(rules[1:5])
#numerical values of measures
quality(rules[1:5])

#Levels of Rules
str(rhs(rules)@itemInfo)


rulelength = length(rules)

rulelabels = labels(rules)
print(rulelabels[1:5])

cut = unlist(strsplit(rulelabels,"=> "))[seq(2,2*rulelength,by=2)]
print(cut[1:15])



#RHS of rule
rules@rhs@itemInfo$labels[rules@rhs@data@i+1]

#Subset of Rules based on items
sub_rules <- rules[3]
inspect(sub_rules)
sub_trans = subset(Groceries, items %in% unlist(as(lhs(sub_rules), "list")))
sub_trans
inspect(sub_trans[1:5])


item <- "whole milk"
arules::subset(rules, rhs %in% "whhole milk")
rules.sub <- subset(rules, lhs %in% item & size(lhs)==1)
inspect(rules.sub)


# rules to DF
df <- as(rules, 'data.frame')
head(df)
#can save now
