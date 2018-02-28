# Basket Analysis - Converting into Transactions format
# 
#
library(arules)
library(arulesViz)

## convert to transaction
trans <- as(df, "transactions")
trans
summary(trans)
inspect(trans)



#creating transactions from data.frame
a_df <- data.frame(
  age   = as.factor(c(6, 8, NA, 9, 16)), 
  grade = as.factor(c("A", "C", "F", NA, "C")),
  pass  = c(TRUE, TRUE, FALSE, TRUE, TRUE))  
## note: factors are translated differently to logicals and NAs are ignored
a_df

## coerce  ## convert to transaction
trans3 <- as(a_df, "transactions") 
inspect(trans3)
as(trans3, "data.frame")

# M3 : format basket
my_data = paste("1,2","1","2,3", sep="\n");
my_data
write(my_data, file = "./data/my_basket");
trans = read.transactions("./data/my_basket", format = "basket", sep=",");
inspect(trans);

#-----------------
## example 4: creating transactions from a data.frame with 
## transaction IDs and items (by converting it into a list of transactions first) 
a_df3 <- data.frame(
  TID = c(1,1,2,2,2,3), 
  item=c("a","b","a","b","c", "b")
)
a_df3
trans4 <- as(split(a_df3[,"item"], a_df3[,"TID"]), "transactions")
trans4
inspect(trans4)
## Note: This is very slow for large datasets. It is much faster to 
## read transactions in this format from disk using read.transactions() 
## with format = "single".
# }

a_list <- list(
  c("a","b","c"),
  c("a","b"),
  c("a","b","d"),
  c("c","e"),
  c("a","b","d","e")
)

## set transaction names
names(a_list) <- paste("Tr",c(1:5), sep = "")
a_list

## coerce into transactions
trans1 <- as(a_list, "transactions")

## analyze transactions
summary(trans1)
image(trans1)
inspect(trans1)



#--------------------

#  creating transactions from a matrix
a_matrix <- matrix(c( 1,1,1,0,0,1,1,0,0,0,1,1,0,1,0,0,0,1,0,1,1,1,0,1,1),ncol=5)
a_matrix
## set dim names
dimnames(a_matrix) <- list(c("a","b","c","d","e"), paste("Tr",c(1:5), sep = ""))
a_matrix

## coerce
trans2 <- as(a_matrix, "transactions")
trans2
inspect(trans2)
