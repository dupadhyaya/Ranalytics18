# Creating Transaction Data  ####
#http://stackoverflow.com/questions/20758814/convert-data-frame-in-r-to-transactions-or-an-itemmatrix
#example 1: creating transactions from a matrix ####
library(arules)
a_matrix <- matrix(c(1,1,1,0,0,1,1,0,0,0,1,1,0,1,0,0,0,1,0,1,1,1,0,1,1), ncol = 5)
#set dim names ####
a_matrix

dimnames(a_matrix) <-  list(
  c("a","b","c","d","e"),
  paste("Tr",c(1:5), sep = ""))

a_matrix
#coerce ####

trans2 <-  as(a_matrix, "transactions")
trans2
inspect(trans2)
#example 2: creating transactions from data.frame ####

a_df <- data.frame(
  age = as.factor(c(6,8,7,6,9,5)), 
  grade = as.factor(c(1,3,1,1,4,1)))  
#note: all attributes have to be factors ####

a_df
#coerce ####

trans3 <- as(a_df, "transactions") 
inspect(trans3)
image(trans3)
data2 = read.csv("dar2.csv")

data2
data2t = as(data2,'transactions')
inspect(data2t)

data3 = read.csv("dar3.csv")
#data3t = as(data3,'transactions')
data3t = read.transactions("dar3a.csv", format = "single", sep = ",")
str(data3t)
head(data3t)
inspect(data3t)
library(datasets)
itemFrequencyPlot(data3t,topN=10,type='absolute')
rules3 = apriori(data3t, parameter=list(minlen=2))
rules3.sorted = sort(rules3, by='lift')
inspect(rules3.sorted)
