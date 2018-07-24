# DF to Transactions

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



