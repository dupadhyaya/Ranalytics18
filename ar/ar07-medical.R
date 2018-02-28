# Onsen
#http://tallman-world.tumblr.com/post/111511141517/rhow-to-make-association-rules-on-r-all-integer
#“onsen_name” is a name of onsen (hot spring) and the other columns mean effects that people can get from it.
library(arules)
onsen <- read.csv("onsen.csv", header = TRUE, row.names=1)
onsen <- as.matrix(onsen)
#If all the columns except the row name are two-valued data (0 or 1), matrix class is easier to deal with in association rules.
#If all the columns are string data, I just convert the data.frame into transaction data without converting it into matrix data.
#Next, I convert onsen matrix into transaction class.
onsen.trans <- as(onsen, "transactions")
summary(onsen.trans) # check what’s in the transaction data.
#With inspect(), check each transaction’s items.
inspect(onsen.trans)
#want to know frequency of items, I can plot as below;
itemFrequencyPlot(onsen.trans, ylim=c(0,1))
#Making association rules ####
#Now that I am fully prepared, I make association rules.
onsen.rule <- apriori(onsen.trans, parameter = list(maxlen=4, support=0.04, confidence=0.55, ext=TRUE))

#apriori() is a function to make association rules.
#maxlen means a number of rules (in this case, number of effects of an onsen) in a association rule.
#support means how often it happens (or probability of an event). 0.04 is not so rare, not too often.
#And confidence means how often it occurs under specific situations. If this is so small, it may be worth making association rules in the first place.
#Now, I check summary of the association rules I’ve made, with summary().
#check a number of rules and how many rules each association rule has.
summary(onsen.rule)

#In order to inspect the contents of association rules, I can do it as below;
inspect(onsen.rule)

#If I want to extract specific association rules, I use subset() as below.
#In this case, I want the result to have “nerve_pain” as the rule body and more than 1 lift.

nerve_pain_and_more_than_1_lift <- subset(onsen.rule, subset=(rhs %in% "nerve_pain") & (lift>1.0))
