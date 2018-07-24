#Association Rule Learning and the Apriori Algorithm
#http://statistical-research.com/association-rule-learning-and-the-apriori-algorithm/
#Often Association Rule Learning is used to analyze the “market-basket” for retailers.  Traditionally, this simply looks at whether a person has purchased an item or not and can be seen as a binary matrix.
library("arules");

library("arulesViz");
#The random data is generated in such a way where there is correlation and has correlated items.
patterns = random.patterns(nItems = 100);
patterns
summary(patterns);

trans = random.transactions(nItems = 100, nTrans = 150, method = "agrawal",  patterns = patterns);
image(trans);
options(digits=2)
itemFrequencyPlot(trans, support = 0.1, cex.names=0.8)
#Sample Transactions from data Set ####
#However, a transaction dataset will usually be available using the approach described in “Data Frames and Transactions“.  
#The rules can then be created using the apriori function on the transaction dataset.
rules = apriori(trans, parameter=list(support=0.05, confidence=0.8));

rules;
inspect(rules)
itemFrequency(trans,type='absolute')
?itemFrequency
#Once the rules have been created a researcher can then review and filter the rules down to a manageable subset.  This can be done in a variety of ways using both graphs and by simply inspecting the rules.

inspect(head(sort(rules, by="lift"),3));

plot(rules);

head(quality(rules));

plot(rules, measure=c("support","lift"), shading="confidence");

plot(rules, shading="order", control=list(main ="Two-key plot"));

#trim down the rules to the ones that are important.

sel = plot(rules, measure=c("support","lift"), shading="confidence", interactive=TRUE);

subrules = rules[quality(rules)$confidence > 0.8];

subrules
# Once again we can now subset the rules to get a visual.  In these graphs we can see the two parts to an association rule: the antecedent (IF) and the consequent (THEN).  These patterns are found by determining frequent patterns in the data and these are identified by the support and confidence.  The support indicates how frequently the items appear in the dataset.  The confidence indicates the number of times the IF/THEN statement on the data are true.  These IF/THEN statements can be visualized by the following graph:

# --------------------
WRITE(rules, file = "", sep = ",", quote = TRUE, col.names = NA)
