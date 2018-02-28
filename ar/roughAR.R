# Rough Work on Association Rules
library(arules) 
data("AdultUCI") 
AdultUCI$ID <- 1:nrow(AdultUCI) 
dim(AdultUCI)
str(AdultUCI)
names(AdultUCI)
summary(AdultUCI)
unique(AdultUCI$`marital-status`)
head(AdultUCI[,c('ID','marital-status')])
lst1 <- split(AdultUCI[,"ID"], AdultUCI[,"marital-status"]) 
#head(lst1)
as(lst1, "transactions") 
#transactions in sparse format with 
# 7 transactions (rows) and 
# 48842 items (columns) 

library(package = "arules")
v = read.csv(file = file('stdin'))
transactions = read.transactions(file = file("stdin"), format = "basket", sep = ",")
#a,b
#a,b,c