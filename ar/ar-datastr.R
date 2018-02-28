# Data Structures for AR in R

data("Groceries")
mydata = Groceries
str(mydata)
dim(mydata)
length (mydata)
size(mydata)
LIST(mydata[1:5]) 
inspect(mydata[1:5])
head(mydata)
mode(mydata)
mydata[1:5]
mydata

summary(rules)

#Transactions to List
LIST(mydata[1:5])
LIST(mydata[1:5])[[1]]
LIST(mydata[1:5])[[1]][1]

#Transactions to Data Frame
mydf = as(mydata,"data.frame")
str(mydf)
head(mydf$items)

#Data Frame to Transactions





#Measures
quality(rules)$improvement <- interestMeasure(rules, measure = "improvement")
quality(rules)



#Making Rules For Continuous Data
discretize (x, method="cluster", categories=3) 


# Calculates affinity - the 'nxn' Jaccard Index affinity matrix
affinity(mydata) 

# Adds "Item 1" to all transactions in transDat
transDat_c <- addComplement(mydata, "meat") 
transDat_c
inspect(transDat_c)

# Duplicate Rules
duplicated(rules) # find out if any rule is duplicated

sum(duplicated(rules))
