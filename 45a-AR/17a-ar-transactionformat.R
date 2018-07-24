# Data Formats : Conversion to Transactions

library(arules)
#Matrix----
library(arules)
m = matrix(c(1,1,1,0,0,1,1,0,0,0,1,1,0,1,0,0,0,1,0,1,1,1,0,1,1,1,0,1,0,1), ncol = 5)
m
dimnames(m) <-  list(paste("Tr",c(1:6), sep = ""), c("a","b","c","d","e" ))
m
trans1 <-  as(m, "transactions")
trans1
inspect(trans1)
rules1= apriori(trans1)
inspect(rules1[1:5])

#Data Frame----
df <- data.frame(
  age = as.factor(c(6,8,7,6,9,5)), 
  grade = as.factor(c(1,3,1,1,4,1)))  

#note: all attributes have to be factors ####
df
trans2 <- as(df, "transactions") 
inspect(trans2)
image(trans2)




#List-----




#csv----
