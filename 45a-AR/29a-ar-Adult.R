# Association Rule Adult ----
data("Adult")
head(Adult)
LIST(Adult[1:5])
rulesA1 = apriori(Adult)
inspect(rulesA1[1:5])
inspect(rulesA1[1:5], ruleSep="---->", itemSep="+", setStart = "", setEnd ="",   linebreak = FALSE)


# Change to any data Frame
myDataFrame= Groceries
#transDat <- as (myDataFrame, "transactions") 
transDat
inspect (transDat[1:10]) 
inspect (transDat[10]) 

?inspect
length (transDat)
size (transDat)
LIST(transDat) 
