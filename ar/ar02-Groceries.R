# Association Rule - Set 3 ###
#http://www.salemmarafi.com/code/market-basket-analysis-with-r/
#if this, then that”.
# The Groceries Dataset
#Imagine 10000 receipts sitting on your table. Each receipt represents a transaction with items that were purchased. The receipt is a representation of stuff that went into a customer’s basket – and therefore ‘Market Basket Analysis’.
#That is exactly what the Groceries Data Set contains: a collection of receipts
#with each line representing 1 receipt and the items purchased. 
#Each line is called a transaction and each column in a row represents an item. 
#You can download the Groceries data set to take a look at it, but this is not a necessary step.

#{ i1,i2} => { ik} : “if a user buys an item in the item set on the left hand side, then the user will likely buy the item on the right hand side too”. 
# {coffee,sugar} => {milk} If a customer buys coffee and sugar, then they are also likely to buy milk.
#three important ratios; the support, confidence and lift.
#Support: The fraction of which our item set occurs in our dataset.
#Confidence: probability that a rule is correct for a new transaction with items on the left.
#Lift: The ratio by which by the confidence of a rule exceeds the expected confidence. 
#Note: if the lift is 1 it indicates that the items on the left and right are independent.

# Load the libraries
library(arules)
library(arulesViz)
library(datasets)

# Load the data set : Items set structure - List Type; Cannot see properly
data(Groceries)
str(Groceries)
head(Groceries)
# Create an item frequency plot for the top 20 items
itemFrequencyPlot(Groceries,topN=20,type="absolute")
#set the min support to 0.001 , minimum conf of 0.8 ; show top 5 rules
# Get the rules
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))

# Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(rules[1:5])
#[3] if someone buys yogurt & cereals, they are 81% likely to buy whole milk too.
summary(rules)
# 410 rules, Most rules are 4 items long
# Sort Rules The first issue we see here is that the rules are not sorted. Often we will want the most relevant rules first. Lets say we wanted to have the most likely rules. We can easily sort by confidence by executing the following code.
rules<-sort(rules, by="confidence", decreasing=TRUE)
inspect(head(rules))
#Rule 4/ other is perhaps excessively long. Lets say you wanted more concise rules. That is also easy to do by adding a “maxlen” parameter to your apriori function:
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8,maxlen=3))
inspect(head(rules))

# Redundancies ####
subset.matrix <- is.subset(rules, rules)
subset.matrix[lower.tri(subset.matrix, diag=T)] <- NA
redundant <- colSums(subset.matrix, na.rm=T) >= 1
rules.pruned <- rules[!redundant]
rules<-rules.pruned
inspect(rules)
# Target Items
#Now that we know how to generate rules, limit the output, lets say we wanted to target items to generate rules. There are two types of targets we might be interested in that are illustrated with an example of “whole milk”:
#  What are customers likely to buy before buying whole milk
#What are customers likely to buy if they purchase whole milk?
#This essentially means we want to set either the Left Hand Side and Right Hand Side. This is not difficult to do with R!
# 1st part
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.08), 
               appearance = list(default="lhs",rhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])
#Likewise, we can set the left hand side to be “whole milk” and find its antecedents.
#Note the following:
#  We set the confidence to 0.15 since we get no rules with 0.8
#We set a minimum length of 2 to avoid empty left hand side items
rules<-apriori(data=Groceries, parameter=list(supp=0.001,conf = 0.15,minlen=2), 
               appearance = list(default="rhs",lhs="whole milk"),
               control = list(verbose=F))
rules<-sort(rules, decreasing=TRUE,by="confidence")
inspect(rules[1:5])

# Visualisation ####
#The last step is visualization. Lets say you wanted to map out the rules in a graph. We can do that with another library called “arulesViz”.
library(arulesViz)
# Interactive Graph - Seperate Window
plot(rules,method="graph",interactive=T,shading=NA)



# Groceries Example 2 ####
#http://rstatistics.net/association-mining-with-r/
library (arules)
library (arulesViz)
library (datasets)
data (Groceries) # Load the data set
str(Groceries)
# Change to any data Frame
myDataFrame= Groceries
transDat <- as (myDataFrame, "transactions") # convert to 'transactions' class
inspect (transDat) # view the observations
length (transDat) # get number of observations
size (transDat) # number of items in each observation
LIST(transDat) # convert 'transactions' to a list, note the LIST in CAPS

#Lets Apply Apriori Algorithm
#For illustrative purpose, Lets continue to work with ‘Groceries’ dataset from ‘arules’ package.
frequentItems <- eclat (Groceries, parameter = list(supp = 0.07, maxlen = 15)) # calculates support for frequent items
itemFrequencyPlot (Groceries,topN=10,type="absolute") # plot frequent items

#A low support and high confidence helps to extract strong relationship even for less overall co-occurrences in data.
rules <- apriori (Groceries, parameter = list(supp = 0.001, conf = 0.5)) # Min Support as 0.001, confidence as 0.8.

#quality(rules) # show the support, lift and confidence for all rules
head(quality(rules))
# Show the top 5 rules, but only 2 digits
options (digits=2)
inspect (rules[1:5])

rules <- sort (rules, by="confidence", decreasing=TRUE) # 'high-confidence' rules.
#How To Control The Number Of Rules in Output ?
#Adjust the maxlen and conf  arguments in the apriori statement to control the number of rules generated. Use your best judgement here.
rules <- apriori (Groceries, parameter = list (supp = 0.001, conf = 0.5, maxlen=3)) # maxlen = 3 limits the elements in a rule to 3

#To get ‘strong‘ rules, increase the value of ‘conf’ parameter. To get ‘longer‘ rules, increase ‘maxlen’
#How To Remove Redundant Rules ?
#Use the below code to find out and filter the redundant rules.
redundant <- which (colSums (is.subset (rules, rules)) > 1) # get redundant rules in vector
rules <- rules[-redundant] # remove redundant rules

#How to Find Rules Related To Given Item/s ? This method is the core of ‘Market basket analysis’ that is useful to make recommendations of new items to your users. 
#This can be achieved by modifying the ‘appearance’ parameter in the apriori() function. For example,
#Find what factors influenced an event ‘X’
#To find out what customers had purchased before buying ‘Whole Milk’. This will help you understand the patterns that led to the purchase of ‘whole milk’.
rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.08), appearance = list (default="lhs",rhs="whole milk"), control = list (verbose=F)) # get rules that lead to buying 'whole milk'

#Find out what events were influenced by a given event

#In this case: the Customers who bought ‘Whole Milk’ also bought. In the equation, ‘whole milk’ is in LHS (left hand side).                  
rules <- apriori (data=Groceries, parameter=list (supp=0.001,conf = 0.15,minlen=2), appearance = list (default="rhs",lhs="whole milk"), control = list (verbose=F)) # those who bought 'milk' also bought..

#Remove redundancies
#Sort the rules, filter the redundant ones and show the Top 7 Rules.

rules <- sort (rules, decreasing=TRUE,by="confidence")

redundant <- which (colSums(is.subset(rules, rules)) > 1) # get redundant rules in vector

rules <- rules[-redundant] # remove redundant rules inspect (rules[1:7])
rules
#Making Rules For Continuous Data
#If you try to make rules on continuous variables, each value will be treated as distinct item, causing undesirable explosion of rules. So, convert the continuous variables to factors, which can be easily done using discretize() function.
#discretize (x, method="cluster", categories=3) # method can make cuts in equal "intervals", "frequency", "cluster", "fixed"

#Visualizing The Rules

# Interactive Plot

plot (rules[1:25],method="graph",interactive=TRUE,shading="confidence") # feel free to expand and move around the objects in this plot

plot (rules, measure=c("support", "lift"), shading="confidence")


affinity(transDat) # Calculates affinity - the 'nxn' Jaccard Index affinity matrix
transDat_c <- addComplement(transDat, "Item 1") # Adds "Item 1" to all transactions in transDat
duplicated(rules) # find out if any rule is duplicated