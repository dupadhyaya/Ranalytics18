# Association Rule - Groceries
#http://datascienceplus.com/implementing-apriori-algorithm-in-r/

df_groceries <- read.csv("groceries.csv")
str(df_groceries)
#Implementing Market Basket Analysis using Apriori Algorithm
dim(df_groceries)
#read transactions

df_sorted <- df_groceries[order(df_groceries$Member_number),]
df_sorted

#convert member number to numeric
df_sorted$Member_number <- as.numeric(df_sorted$Member_number)
str(df_sorted)
head(df_sorted)
#convert item description to categorical format
df_sorted$itemDescription <- as.factor(df_sorted$itemDescription)
str(df_sorted)
#convert dataframe to transaction format using ddply; 

#if(sessionInfo()['basePkgs']=="dplyr" | sessionInfo()['otherPkgs']=="dplyr"){
#  detach(package:dplyr, unload=TRUE)
#}
library(dplyr)

#group all the items that were bought together; by the same customer on the same date
library(plyr)
?ddply

df_itemList <- ddply(df_groceries, c("Member_number","Date"), function(df1)paste(df1$itemDescription,collapse = ","))

#remove member number and date
df_itemList$Member_number <- NULL
df_itemList$Date <- NULL
str(df_itemList)
colnames(df_itemList) <- c("itemList")
str(df_itemList)
head(df_itemList,n=20)
df_itemList
#write to csv format
write.csv(df_itemList,"ItemList.csv", row.names = TRUE)

#-------------------- association rule mining algorithm : apriori -------------------------#

#load package required
library(arules)

#convert csv file to basket format - transactions
txn = read.transactions(file="ItemList.csv", rm.duplicates= TRUE, format="basket",sep=",",cols=1);
txn = read.transactions(file.choose(), rm.duplicates= TRUE, format="basket",sep=",",cols=1);
txn
inspect(txn)
#remove quotes from transactions
txn@itemInfo$labels <- gsub("\"","",txn@itemInfo$labels)


#run apriori algorithm
basket_rules <- apriori(txn,parameter = list(minlen=2,sup = 0.01, conf = 0.7, target="rules"))
#basket_rules <- apriori(txn,parameter = list(minlen=2,sup = 0.00001, conf = 0.01, target="rules"),appearance = list(lhs = "CLEMENTINES")))
inspect(basket_rules)  # no rule

#check if tm is attched; if yes then detach
if(sessionInfo()['basePkgs']=="tm" | sessionInfo()['otherPkgs']=="tm"){
  detach(package:sentiment, unload=TRUE)
  detach(package:tm, unload=TRUE)
}


#view rules
inspect(basket_rules)

#convert to datframe and view; optional
df_basket <- as(basket_rules,"data.frame")
df_basket$confidence <- df_basket$confidence * 100
df_basket$support <- df_basket$support * nrow(df)

write.csv(df_basket,"Rules_20.csv",row.names = FALSE)

#plot the rules
library(arulesViz)
plot(basket_rules)

set.seed(8000)
plot(basket_rules, method = "grouped", control = list(k = 5))

plot(basket_rules[1:10,], method="graph", control=list(type="items"))

plot(basket_rules[1:10,], method="paracoord",  control=list(alpha=.5, reorder=TRUE))

itemFrequencyPlot(txn, topN = 5)

plot(basket_rules[1:10,],measure=c("support","lift"),shading="confidence",interactive=T)

